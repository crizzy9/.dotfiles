info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m$USER\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Usage: if exists bash;
exists()
{
  command -v "$1" >/dev/null 2>&1
}

# Function to retrieve the operating system (uname) (in form Mac, Linux, Windows)
