"""
jake pauls
https://jakepauls.dev
https://github.com/jake-pauls
"""

import re
import sys

"""
p4diff.py
a simple tool for a colorized diff of the p4 output
usage: p4 diff | python p4diff.py
"""

RESET = "\033[0m"
BOLD = "\033[1m"
BLINK = "\033[5m"

## Foreground colors
BLACK = "\033[30m"
RED = "\033[31m"
GREEN = "\033[32m"
BROWN = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"
WHITE = "\033[37m"

FILE_R = r'^====.*====$'
OUT_R  = r'^(< |\-)'
IN_R   = r'^(> |\+)'

ansi_mappings = {FILE_R: MAGENTA, OUT_R: RED, IN_R: GREEN}


def _color_line(line):
    for pattern in ansi_mappings.keys():
        if re.match(pattern, line) is not None:
            return f"{ansi_mappings[pattern]} {line} {RESET}"
    return line


def colorize():
    for line in sys.stdin:
        print(_color_line(line))


if __name__ == "__main__":
    colorize()
