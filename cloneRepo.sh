# read repo name
echo "Name of repo"
read repoName

arrayUser=("student1" "student2" "student3")

#  getting the whole array and go through indexes 
for i in ${!arrayUser[@]}; do
    
    username="${arrayUser[i]}"
    echo $username
    
    # clone the repo of the user
    git clone "git@github.com:FbW-WD-22-D01/"${repoName}"-"${username}".git"
    
    # check if directory was created and if count commits
     if [ -d "./"${repoName}"-"${username}"" ]; then 
        commitCount=$(git --git-dir=./"${repoName}"-"${username}"/.git shortlog | grep -E '^[ ]+\w+' | wc -l)
        echo "We have - ${commitCount}"
        # if to less commits delete the repo
        if [ "$commitCount" -le 3 ] 
            then
            echo "To less commits ${commitCount} - delete"
            rm -rf "./"${repoName}"-"${username}""
        fi
    fi
done

# start vs code
code .
