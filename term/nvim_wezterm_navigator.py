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
opts.add_argument("action")


def main(args):
    nvim = connect(args.socket)
    if args.action == "move":
        success = maybe_move(nvim, args.direction)
    elif args.action == "resize":
        success = maybe_resize(nvim, args.direction)
    else:
        print("Something went wrong")
        sys.exit(3)
    if not success:
        sys.exit(1)


def connect(path):
    try:
        return pynvim.attach("socket", path=path)
    except Exception:
        sys.exit(2)


def maybe_resize(nvim, direction):
    commands = {
        "Up": "resize +3",
        "Down": "resize -3",
        "Left": "vertical resize -3",
        "Right": "vertical resize +3",
    }
    nvim.command(commands[direction])
    print(f"Resized in direction: {direction}")
    return True


def maybe_move(nvim, direction):
    winnr = nvim.call("winnr")
    nvim.command(f"wincmd {directions.get(direction, direction)}")

    return not (winnr == nvim.call("winnr"))


if __name__ == "__main__":
    main(opts.parse_args())
