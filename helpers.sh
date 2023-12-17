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

skip () {
  printf "\r  [ \033[0;35mSKIP\033[0m ] $1\n"
}

# Usage: if exists bash;
exists()
{
  command -v "$1" >/dev/null 2>&1
}

# Function to retrieve the operating system (uname) (in form Mac, Linux, Windows)


# TODO: modify setup to use ssh
# Setup git using ssh
setup_gitconfig () {
    # ask if git config needs to be installed
    # file not exists because existing settings will be set in .example copied over to original symlink which will later be symlinked
    if ! [ -f ${ROOT_DIR}/git/gitconfig.symlink ]; then
        info 'setting up git config'
        git_credentials='cache'
        if [ "$(uname -s)" == "Darwin" ]; then
            git_credentials='osxkeychain'
        fi

        # how is it different from username?
        user ' - What is your github author name?' # exMachina
        read -e git_authorname 

        user ' - What is your github author email?' # shyam.padia@live.com
        read -e git_authoremail 

        user ' - What is your github user name?' # crizzy9
        read -e github_username 

        # set up ssh instead and make it optional
        # user ' - What is your GPG signing key? (Run `gpg --list-keys`)'
        # read -e gpg_signing_key

        user 'Do you want to setup ssh for git? [y]es, [n]o'
        read -n 1 shon
        if [ -f "~/.ssh/config" && -f "~/.ssh/id_rsa" ]; then
            info "SSH for git already set up."
            user "Copying the key into clipboard..."
            pbcopy < ~/.ssh/id_rsa.pub
            info "Copy the key onto github (https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account)"
        elif [ $shon == "y" ]; then
            info 'Generating ssh-key'
            ssh-keygen -t rsa -b 4096 -C "$git_authoremail"
            info 'Starting SSH agent'
            eval "$(ssh-agent -s)"
            info 'Modifying ~/.ssh/config'
            echo "Host *\n\tAddKeysToAgent yes\n\tUseKeychain yes\n\tIdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
            info "Adding SSH key"
            ssh-add -K ~/.ssh/id_rsa
            user "Copying the key into clipboard..."
            pbcopy < ~/.ssh/id_rsa.pub
            info "Copy the key onto github (https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account)"
        fi

        sed -e "s/AUTHOR_NAME/$git_authorname/g" -e "s/AUTHOR_EMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credentials/g" -e "s/AUTHOR_HANDLE/$github_username/g" git/gitconfig.symlink.example > git/gitconfig.symlink

        success 'git config'

    else
        info 'Skipping... git config already setup'
    fi
}

# links 2 given files based on user input
link_file()  {
    local src=$1 dst=$2
    local overwrite= backup= skip=
    local action=

    user "Do you want to sym link $(basename "${src%.*}")? [y]es, [n]o"
    read -n 1 action
    if [ $action == "y" ]; then
      info "attempting to symlink: $1 ---> $2"
      # -f if a file -d if if a direactory -L if a symbolic link, -o or
      if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
          if  [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
              local currentSrc="$(readlink $dst)" # reads destination symlink if it exists and checks if symlink already established with source
              if [ "$currentSrc" == "$src" ]; then
                  skip=true;
              else
                  # basename gets the actual name from the path
                  user "File already exists: $dst ($(basename "$src")), What do you want to do?\n\
                      [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                  # reads only 1 character using -n 1
                  read -n 1 action

                  case "$action" in
                      o )
                          overwrite=true;;
                      O )
                          overwrite_all=true;;
                      s )
                          skip=true;;
                      S )
                          skip_all=true;;
                      b )
                          backup=true;;
                      B )
                          backup_all=true;;
                      * )
                          ;;
                  esac
              fi
          fi


          # set overwrite as the value of all
          overwrite=${overwrite:-$overwrite_all}
          skip=${skip:-$skip_all}
          backup=${backup:-$backup_all}

          if [ "$overwrite" == "true" ]; then
              rm -rf "$dst"
              success "removed $dst"
          fi

          if [ "$backup" == "true" ]; then
              mv "$dst" "${dst}.backup"
              success "moved $dst to ${dst}.backup"
          fi

          if [ "$skip" == "true" ]; then
              skip "$src"
          fi
      fi

      if [ "$skip" != "true" ]; then # link src to dst
          ln -s "$1" "$2" # establish a softlink
          success "symlink established: $1 ---> $2"
      fi
    else
      skip "symlink $(basename "${src%.*}")"
    fi
}

# apply symlink based on old/new configuration
# TODO: add a file with all symlinks as datastore
# TODO: make it a bit more smart to gracefully apply symlinks for harder cases
apply_symlink() {
    ROOT_DIR=$(pwd -P)

    local dir=$1
    local type=$2

    local files=
    local current_dir="${ROOT_DIR}/${dir}"
    
    info "applying symlink on\n\t type: \n\t\t ${type}\n\t directory: \n\t\t ${current_dir}"

    # getting the filename from path without the extension, should ignore other files due to maxdepth
    if [ "$type" == "old" ]; then
      files=$(find -H "$current_dir" -maxdepth 1 -name "*old*.symlink" -not -path '*.git*')
    elif [ "$type" == "new" ]; then
      files=$(find -H "$current_dir" -maxdepth 1 -name "*.symlink" -not -name "*old*" -not -path '*.git*')
    else
      fail "Invalid symlink type"
    fi

    if [[ $files ]]; then
      for src in $files; do
          dst="$HOME/.$(basename "${src%.*}")"
          link_file "$src" "$dst"
      done
    else
      info "No files found to symlink"
    fi
}