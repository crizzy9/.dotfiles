source ./helpers.sh

os=
get_os os

info "Current OS: $os"

# syntax: apply_symlink <src_dir> <src_symlink_file> <exclude> <dest_suffix> <dest_file>
# src_file is without extension - default is .symlink
# dest_file is with extension, if empty - it will be the same as src_symlink_file
apply_symlink "test" "lala" "" ".config/test" "abc.lua"

lala() {
    local a=$1
    local b=$2
    local c=${3:-nan}
    local d=${4:-nan2}
    local e=${5:-""}

    eb="${HOME}/${e}"
    re='.*/$'
    [[ $eb =~ $re ]] || eb+="/"
    src="/Users/spadia/.dotfiles/test/lala.symlink"
    ebx="${eb}.$(basename "${src%.*}")"

    info "a: $a, b: $b, c: $c, d: $d, e: $e, eb: $eb, ebx: $ebx"
}

# lala "aaa" "bbb" "ccc" "ddd"
# lala "aaa" "bbb"
# lala "aaa" "bbb" "ccc"
# lala "aaa" "bbb" "" "ddd"
lala "aaa" "bbb" "" "" "eee"
lala "aaa" "bbb" "cc" "" ""