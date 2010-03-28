#!/usr/bin/env python
'''
File: djvim.py
Author: Viktor Nagy
Description: Start Vim with django environment set up properly

Usage: python djvim projectdir [arguments] [file1 [...]]

Required:
projectdir      Sets the base directory for the project

Optional arguments:
--settings -s   Sets the settings file used. It defaults to projectdir/settings
--help -h       Print this help
-d              Switch on debugging
'''
import sys, getopt, os

def usage():
    """Prints usage information"""
    print __doc__

def main(projectdir, settings, *files):
    """Run vim from projectdir with the given settings file set as DJANGO_SETTINGS_MODULE, and open *files automatically"""

    cmd = 'DJANGO_SETTINGS_MODULE=%s gvim "+cd %s" "+TlistAddFilesRecursive . [^_]*py\|*html\|*css" %s' \
        % (settings, projectdir, ' '.join(files))
    os.system(cmd)

if __name__ == '__main__':
    if len(sys.argv) < 2 or not os.path.isdir(sys.argv[1]):
        sys.stderr.write('No project directory given or it does not exist')
        usage()
        sys.exit(2)

    projectdir = sys.argv[1]
    settings = 'settings'

    try:
        opts, args = getopt.getopt(sys.argv[2:], "hs:", ["help", "settings="])
    except getopt.GetoptError:
        sys.stderr.write('Wrong options')
        usage()
        sys.exit(2)
    
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-s", "settings"):
            settings = arg 
            
    main(projectdir, settings, *args)

