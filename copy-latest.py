#! /usr/bin/env python3

# copy the latest n files from source to destination
# TODO: read source, destination and n from command file
# TODO: add verbose flag
# TODO: handle file/directory permissions (fstat)

import sys
import os
import shutil
import argparse

# source and destination root directories
SRCROOT = "/garfunkel/music"
DSTROOT = "/run/media/marko/9016-4EF8"

def copyfile(src, dst):
    """Copy file from src to dst."""
    if not os.path.exists(src):
        print(f"Source file {src} not found, file skipped.")
        return False

    if os.path.exists(dst):
        print(f"Destination file {src} already exists, file skipped.")
        return False

    # create path to destination
    os.makedirs(os.path.dirname(dst), exist_ok=True)

    # copy file
    newfile = shutil.copy2(src, dst)
    if newfile != dst:
        print(f"Failed to copy file {src}")
        return False
    else:
        print(f"Copied file {src}\n-> {dst}")
        return True

def main(argv):
    """Copy the latest N files from source to destination."""
    parser = argparse.ArgumentParser(description=main.__doc__)
    parser.add_argument("-n", "--numfiles",
                        help="number of files to copy",
                        metavar="N",
                        default=100,
                        type=int)
    parser.add_argument("-v", "--verbose",
                        help="show verbose output",
                        action="store_true")
    parser.add_argument("source",
                        help="source directory")
    parser.add_argument("destination",
                        help="destination directory")
    args = parser.parse_args()
    if args.verbose:
        return

    # get the latest x files
    for file in open("Latest100.m3u", "rt", 1):
        # remove preceding dot and trailing newline
        file = file[1:].rstrip()
        src = SRCROOT + file
        dst = DSTROOT + file
        copyfile(src, dst)

if __name__ == "__main__":
    main(sys.argv)
