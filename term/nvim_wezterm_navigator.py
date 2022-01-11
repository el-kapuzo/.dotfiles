import argparse
import sys

import pynvim

directions = {
    "Right": "l",
    "Left": "h",
    "Up": "k",
    "Down": "j",
}

opts = argparse.ArgumentParser()
opts.add_argument("--socket")
opts.add_argument("--direction")

args = opts.parse_args()

nvim = pynvim.attach("socket", path=args.socket)
winnr = nvim.call("winnr")
nvim.command(f"wincmd {directions.get(args.direction, args.direction)}")

if winnr == nvim.call("winnr"):
    sys.exit(1)
