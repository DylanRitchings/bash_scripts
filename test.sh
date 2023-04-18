
##Filter list with fzf
# languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
# core_utils=$(echo "find xargs sed awk" | tr " " "\n")
# chtsht=$(echo -e "$languages\n$core_utils" | fzf)


# string1=/Users/dylan/dev/Repos/bash_scripts/main/engine_service/es/src/test
#/Users/dylan/dev/Repos/bash_scripts/main/service_layer/sl/src/test
#/Users/dylan/dev/Repos/bash_scripts/*/sl/src/test
function swch {
    #local dir_path repo_path find_path start end start_path end_path
    start="main"
    end="src"

    dir_path=$(pwd | tr '[:upper:]' '[:lower:]')

    repo_path=$(git rev-parse --show-toplevel | tr '[:upper:]' '[:lower:]')

    #find_path=$(echo $dir_path | sed 's/main.*src/main\/\*\/src/')
    #find_path=$(echo $dir_path | sed "s/$start.*$end/$start\/\*\/$end/")

    start_path=$(echo $dir_path | sed "s/$start.*/$start/")
    end_path=""
    if [[ $dir_path =~ $end ]]; then
        end_path=$(echo $dir_path | sed "s/.*$end/\/$end/")
    fi

    find_path="${start_path}/*${end_path}"


    all_paths=$(find "$repo_path" -path "$find_path" -type d)

    dir_path=$(echo $all_paths | fzf)
    echo ${dir_path}
    cd "${dir_path}" || exit

    #TODO find a way to stay in the same dir num
    #count slashes and remove any string with more than one slash
}


#slash_count=$(echo $find_path | grep -o "/" | wc -l)
# # loop through each line in $all_paths
# while read line; do
#     # count the number of slashes in the line
#     num_slashes=$(echo "$line" | grep -o "/" | wc -l)

#     # if the number of slashes is less than or equal to $slash_count, print the line
#     if [ "$num_slashes" -le "$slash_count" ]; then
#         echo "$line"
#     fi
# done <<< "$all_paths"

