function cdf {
    path="$(find . -print | fzf)"
    if [[ -f $path ]]; then
        path="$(dirname $path)/"
    fi
    cd $path
    unset path
}
