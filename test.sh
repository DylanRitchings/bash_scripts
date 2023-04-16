
##Filter list with fzf
# languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
# core_utils=$(echo "find xargs sed awk" | tr " " "\n")
# chtsht=$(echo -e "$languages\n$core_utils" | fzf)



function "dev" {
    cd ~/Dev/
    fzf
}

function "rep" {
    cd ~/Dev/Repos/
    fzf
}
