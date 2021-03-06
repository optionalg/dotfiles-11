#!/bin/bash
download_pattern='a href="/b4winckler/macvim/archive/[^"]*.tar.gz"' \
download_path=$(curl https://github.com/b4winckler/macvim/releases| grep "${download_pattern}"|cut -f2 -d\"|head -1) \
download_dir=~/Downloads/$(basename -s .tbz ${download_path})
echo "---------------------------------------------"
echo "downloading $download_path into $download_dir"
echo "---------------------------------------------"
curl --location https://github.com${download_path} | tar -x -z -C ~/Downloads/ && open ${download_dir}
