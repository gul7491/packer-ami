#!/bin/bash
command -v git >/dev/null 2>&1 ||
     { echo >&2 "Git is not installed. Installing..";
             sudo apt update -y
             sudo apt install git

      }
GIT_VERSION="$(git --version)"
echo "git installed version:- " $GIT_VERSION