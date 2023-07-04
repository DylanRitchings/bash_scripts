
##Filter list with fzf
# languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
# core_utils=$(echo "find xargs sed awk" | tr " " "\n")
# chtsht=$(echo -e "$languages\n$core_utils" | fzf)


# string1=/Users/dylan/dev/Repos/bash_scripts/main/engine_service/es/src/test
#/Users/dylan/dev/Repos/bash_scripts/main/service_layer/sl/src/test
#/Users/dylan/dev/Repos/bash_scripts/*/sl/src/test




function swch {
    local replace_array dir_path repo_path dir_num depth_string repo_depth depth all_paths dir_path final_path

    declare -a replace_array=(1 7 9 11)
    dir_path=$(pwd) #| tr '[:upper:]' '[:lower:]')
    repo_path=$(git rev-parse --show-toplevel) #| tr '[:upper:]' '[:lower:]')

    depth_string=${dir_path//[!\/]}
    repo_depth=${repo_path//[!\/]}
    depth=$(expr ${#depth_string} - ${#repo_depth} - 1)

    for dir_num in "${replace_array[@]}"

    do
        dir_path=$(echo $dir_path | sed "s|\/[^/]*[[:alpha:]*]|/.\*|${dir_num}")
    done

    dir_path=${dir_path#\/}

    all_paths=$(find "$repo_path" -maxdepth "$depth" -mindepth "$depth" -regex "$dir_path" -type d )
    final_path=$(echo ${all_paths//$repo_path} | tr ' ' '\n' | fzf )

    if [ ! -z "$final_path" ]
    then
        cd "${repo_path}${final_path}" || exit
    fi
}

function swch2 {


    local replace_array dir_path repo_path dir_num depth_string repo_depth depth all_paths dir_path final_path

    declare -A replace_hm=(
        ["C:/Users/dylan.ritchings/dev/repos/aviation-data-services"]="1 7 9 11"
    )

    repo_path=$(git rev-parse --show-toplevel) #| tr '[:upper:]' '[:lower:]')

    #put into if - fuzzy match path
     #echo $replace_hm

    declare -A replace_vals=${replace_hm[$repo_path]}
    echo $replace_vals
    declare -a test=${replace_vals[0]}
    echo "TEST"
    echo $test
    echo "TEST"
    # declare -a replace_array=(1 7 9 11)
    dir_path=$(pwd) #| tr '[:upper:]' '[:lower:]')

    depth_string=${dir_path//[!\/]}
    repo_depth=${repo_path//[!\/]}
    depth=$(expr ${#depth_string} - ${#repo_depth} - 1)

    for dir_num in "${replace_vals[@]}"

    do
        echo $dir_num
        dir_path=$(echo $dir_path | sed "s|\/[^/]*[[:alpha:]*]|/.\*|${dir_num}")
    done

    dir_path=${dir_path#\/}

    all_paths=$(find "$repo_path" -maxdepth "$depth" -mindepth "$depth" -regex "$dir_path" -type d )
    # final_path=$(echo ${all_paths//$repo_path} | tr ' ' '\n' | fzf )

    # if [ ! -z "$final_path" ]
    # then
    #     cd "${repo_path}${final_path}" || exit
    # fi
}


#/*/Users/dylan.ritchings/dev/repos/aviation-data-services/*/cdk/*/src/*/service
#all_paths=$(find "$repo_path" -maxdepth "$depth" -mindepth "$depth" -path "*/Users/dylan.ritchings/dev/repos/aviation-data-services/*/cdk/*/src/*/service" -type d )
