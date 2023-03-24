fzf_file_preview() {
    if [ -d "$1" ]; then
        tree "$1" -C -L 3
    else
        bat "$1" --style=numbers --color=always --pager=never
    fi
}

fzf_search_file() {
    filename=$(( find * -type f & find * -type d ) 2> /dev/null | fzf --preview 'fzf_file_preview {}')
    if [ -d $filename ]; then
        cd $filename
    elif [ -f $filename ]; then
        cd $(dirname $filename)
        vi $(basename $filename)
    fi
}
