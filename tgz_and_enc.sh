#!/bin/bash 
tar czf /data/tgz_enc/$1.tgz $1
openssl aes-256-cbc -a -e -in /data/tgz_enc/$1.tgz -out /data/tgz_enc/$1.tgz.enc
echo "file /data/tgz_enc/$1.tgz.enc has been created"
echo "please remove if sizes make sense /data/tgz/$1.tgz"
du -sh /data/tgz_enc/$1.tgz /data/tgz_enc/$1.tgz.enc



