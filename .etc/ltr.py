#!/usr/bin/env python
import sys, os, os.path as path
from getopt import getopt

opts, args = getopt(sys.argv[1:], 'v')
opts = dict(opts)
# log = lambda s: (


torrents_source_dir = path.expanduser('~/Downloads')
into_dir = '/Volumes/rttr'

if len(sys.argv) == 2:
    into_dir = path.sep.join((into_dir, sys.argv[1]))
print('=> {}'.format(into_dir))

os.chdir(torrents_source_dir)
torrents = list(filter(lambda s: path.splitext(s)[1] == '.torrent', os.listdir()))
if len(torrents) == 0:
    exit('no any .torrent file found in {}'.format(torrents_source_dir))

if len(torrents) == 1:
    torrent_file = path.abspath(torrents[0])
else:
    by_date_added = sort(torrents, key=path.getctime)
    exit('todo: sort and get last')

print('torrent file: {}'.format(torrent_file))
rc = os.system('btcli add {} -d {}'.format(torrent_file, into_dir))
if rc == 0:
    # log('successful, rm')
    os.remove(torrent_file)
    
