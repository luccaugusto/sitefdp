#!/bin/bash

echo "UPLOADING"
rsync -avz _site/ $USER@luccaaugusto.xyz:/var/www/fundodopoco.xyz/html/

echo "UPDATE GIT"
git add .
git commit && #-m "$MSG"
git push
