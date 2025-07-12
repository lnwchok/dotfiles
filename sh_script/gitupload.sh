#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: No commit message found"
	exit 1
fi

git add .
git commit -m "$1"
git push -u origin main
echo "\nThanks"
