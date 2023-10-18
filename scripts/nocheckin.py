"""
jake pauls
https://jakepauls.dev
https://github.com/jake-pauls
"""

import re
import os
import argparse
import platform
import subprocess
from subprocess import check_output

"""
nocheckin.py
an in-progress tool for using '#nocheckin' in my files as a todo list before checking things in
usage: python nocheckin.py <p4_user> -cl <cl_number>

todo: pretty print output results?
todo: refactor to use the p4 python API instead?
todo: add CL numbers in output for non-specific lookups
"""

# Change this to search for a different tag/pattern in files
nocheckin_pattern = "#nocheckin"

# Windows defaults
file_ending = "\r\n" if platform.system() == "Windows" else "\r"
use_shell = platform.system() == "Windows"

# File structures
cl_file_list = []
p4_opened_list = []

# CLI arguments
use_full_paths = False
include_binaries = False


def main():
    parser = argparse.ArgumentParser(
        prog="nocheckin",
        description="evaluates files in P4 for a #nocheckin tag",
    )

    # Required: the user in p4 executing the nocheckin command
    parser.add_argument("p4_user")
    # Optional arguments for operations, only one of these needs to be included
    # Will default to the 'cl' operation if included via the CLI
    parser.add_argument("-cl", "--cl-number", help="uses `p4 opened` on the target CL if included, this is faster than a file and is run by default")
    parser.add_argument("-f", "--file-path", help="uses `p4 opened` to view all client files and filter for the appropriate CL, use this if you don't have the CL number (such as in VS)")
    parser.add_argument("-fp", "--full-paths", help="prints the entire depot path from p4 when displaying checked files", action="store_true")
    parser.add_argument("-b", "--binary", help="includes binary files (such as .uassets) in checks", action="store_true")

    args = parser.parse_args()
    user = args.p4_user

    # Use full depot paths if specified by the command line
    if args.full_paths is True:
        global use_full_paths
        use_full_paths = True

    # Include binary files if specified by the command line
    if args.binary is True:
        global include_binaries
        include_binaries = True

    # Default to checking with CL if included
    cl = args.cl_number
    if cl is not None:
        check_cl(user, cl)
        return

    # If only a file path is included, find the CL for it and run it
    p4_file_path = args.file_path
    if p4_file_path is not None:
        found_cl = get_cl_with_p4_file_path(p4_file_path)
        print(f"[CL] Found {p4_file_path} in {found_cl}")
        check_cl(user, found_cl)
        return

    # If no arguments are specified, run on all files
    check_cl(user, None)


def check_cl(user: str, cl: str) -> None:
    p4_cmd = []
    if cl is not None:
        p4_cmd = ["p4", "opened", "-u", user, "-c", cl]
    else:
        p4_cmd = ["p4", "opened", "-u", user]

    # Split opened list on file ending, remove empty strings
    p4_opened_list = check_output(p4_cmd, shell=use_shell).decode().split(file_ending)
    p4_opened_list = [opened_file for opened_file in p4_opened_list if opened_file != ""]

    # Iterate through the opened files
    # todo: collect files and report results
    for file_str in p4_opened_list:
        if file_str == "":
            continue

        # P4 tends to use the hyphen with spaces to separate the file from the user data
        file_path = file_str.split(" - ")[0]
        # Need to get rid of the revision
        file_path_no_revision = file_path.split("#")[0]

        # Find all versions of the file, remove empty strings
        p4_where_res = check_output(["p4", "where", file_path_no_revision], shell=use_shell, stderr=subprocess.DEVNULL).decode().split(file_ending)[0].split(" ")
        p4_where_res = [found_file for found_file in p4_where_res if found_file != ""]
        # Check to make sure it was retrieved
        if len(p4_where_res) == 0:
            display_file_path = os.path.basename(file_path_no_revision) if not use_full_paths else file_path_no_revision
            print(f"[OUT OF SCOPE] {display_file_path}")
            continue

        # Last item in the list is most likely the local copy (p4 seems to print this as: dev, workspace, local)
        local_file_copy = p4_where_res[-1]
        display_file_path = os.path.basename(local_file_copy) if not use_full_paths else local_file_copy

        # Check if this file is deleted from the original `p4 opened` output
        if file_str.__contains__("delete"):
            print(f"[DELETED] {display_file_path}")
            continue

        # Prune binary files (such as .uassets, since no editor/terminal prints them nicely)
        # Although, it's worth noting that for .uassets, '#nocheckin' can still be found in the binary and will show up.
        # However, almost every terminal will error bell and VS won't even run.
        if include_binaries is False:
            textchars = bytearray({7,8,9,10,12,13,27} | set(range(0x20, 0x100)) - {0x7f})
            is_binary_string = lambda bytes: bool(bytes.translate(None, textchars))
            if is_binary_string(open(local_file_copy, 'rb').read(1024)):
                print(f"[BINARY] {display_file_path}")
                continue

        # Open file if path handling was successful and match for a '#nocheckin'
        print(f"[CHECKING] {display_file_path}")
        with open(local_file_copy, "r", encoding="ISO-8859-1") as file:
            line_count = 0
            for line in file:
                if re.search(nocheckin_pattern, line):
                    print(f"\t[{line_count}]\t {line.strip()}")
                line_count += 1


def get_cl_with_p4_file_path(p4_file_path: str) -> str:
    p4_opened_res = check_output(["p4", "opened", "-s"], shell=use_shell, stderr=subprocess.DEVNULL).decode().split(file_ending)
    p4_opened_res = [found_file for found_file in p4_opened_res if found_file != ""]

    # Attempt to find matches for file name
    file_basename = os.path.basename(p4_file_path)
    matches = [opened_file for opened_file in p4_opened_res if re.search(file_basename, opened_file)]

    # `p4 opened` output typically matches - `file - edit default change` or `file - edit change cl_number`
    # Attempt to retrieve CLs for all available matches
    file_cl_map = {}
    for file in matches:
        file_path_cl_number_split = file.split(f" - edit ")
        # p4 file path: '//depot//project//...'
        file_path = file_path_cl_number_split[0]
        # one of 'change cl_number' or 'default change'
        cl_number = file_path_cl_number_split[1]

        # Check for a default or numbered CL
        split_cl_number = cl_number.split(" ")
        cl_number = split_cl_number[0] if cl_number.__contains__("default") else split_cl_number[1]

        # Create a mapping of files to the CL they belong to
        file_cl_map[os.path.basename(file_path)] = cl_number

    return file_cl_map[p4_file_path]


if __name__ == "__main__":
    main()
