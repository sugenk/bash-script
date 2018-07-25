#!/bin/bash
# restore? tar -xvzpf filename.tar.gz
mulai=$(date +%Y%m%d%H%M%S)
tar -cvzpf backup/html-$mulai.tar.gz --exclude "html/files" --exclude "html/img" html/
selesai=$(date +%Y%m%d%H%M%S)
mv backup/html-$mulai.tar.gz backup/html-$mulai-$selesai.tar.gz
