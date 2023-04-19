
##Filter list with fzf
# languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
# core_utils=$(echo "find xargs sed awk" | tr " " "\n")
# chtsht=$(echo -e "$languages\n$core_utils" | fzf)


# string1=/Users/dylan/dev/Repos/bash_scripts/main/engine_service/es/src/test
#/Users/dylan/dev/Repos/bash_scripts/main/service_layer/sl/src/test
#/Users/dylan/dev/Repos/bash_scripts/*/sl/src/test




function swch {
    local replace_array dir_path repo_path dir_num depth all_paths dir_path

    declare -a replace_array=(7 8)
    dir_path=$(pwd | tr '[:upper:]' '[:lower:]')
    repo_path=$(git rev-parse --show-toplevel | tr '[:upper:]' '[:lower:]')

    for dir_num in "${replace_array[@]}"
    do
        dir_path=$(echo $dir_path | sed "s|\/[^/]*[[:alpha:]*]|/\*|$dir_num")
    done

    depth=$(pwd | sed "s|$repo_path||" | tr -dc '/' | wc -c)

    all_paths=$(find "$repo_path" -path "$dir_path" -type d -maxdepth $depth -mindepth $depth)

    dir_path=$(echo $all_paths | fzf)

    cd "${dir_path}" || exit

}





#TODO find a way to stay in the same dir num
#count slashes and remove any string with more than one slash
#
# # loop through each line in $all_paths
# while read line; do
#     # count the number of slashes in the line
#     num_slashes=$(echo "$line" | grep -o "/" | wc -l)

#     # if the number of slashes is less than or equal to $slash_count, print the line
#     if [ "$num_slashes" -le "$slash_count" ]; then
#         echo "$line"
#     fi
# done <<< "$all_paths"

