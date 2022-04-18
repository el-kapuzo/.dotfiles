import sys

major_version = sys.version_info[0]
minor_version = sys.version_info[1]

sys.ps1 = "[{}, {}]: ".format(major_version, minor_version)
