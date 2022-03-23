# read repo name
echo "Which repo you wanne check??"
read repoName

usersArr=("AlonaWeizel" "makombengas" "CarinaBoehm" "nang92" "heikofresh" "tonyfverdu" "dimilidi" "maikklemm" "Baba3200" "Martyna1202" "Orianaqh" "paulinahry" "Raouia2011" "mohsenreza1" "SasaJovanovic90" "SoerenDCI" "Timon24h" "H0sc" "vladko27" "puckfried")

studenstNot=()
studentsAccept=()
studentsSolve=()

#  getting the whole array and go through indexes 
for i in ${!usersArr[@]}; do
    
    username="${usersArr[i]}"
    echo $username
    
    # clone the repo of the user
    git clone "git@github.com:FbW-WD-22-D01/"${repoName}"-"${username}".git"
    

    # check if directory was created and if count commits
    if [ -d "./"${repoName}"-"${username}"" ]
    then 
        commitCount=$(git --git-dir=./"${repoName}"-"${username}"/.git shortlog | grep -E '^[ ]+\w+' | wc -l)
        echo "We have - ${commitCount}"
        # if to less commits delete the repo
        if [ "$commitCount" -le 3 ] 
            then
                studentsAccept+=("${username}")
                echo "To less commits ${commitCount} - delete"
                rm -rf "./"${repoName}"-"${username}""
            else
                studentsSolve+=("${username}")
        fi
    else
        studentsNot+=("${username}")
    fi
done

clear

output="
***************** Result ****************

Student(s) did not start: ${studentsNot[*]}

* * * * * * * * * * * * * * * * * * * * * 

Student(s) did not push: ${studentsAccept[*]}

* * * * * * * *  * * * * * * * ** * * * * 

Student(s) solved: ${studentsSolve[*]}

*************** DONE *********************" 

echo "${output}"

echo "${output}" > result.txt


# start vs code
code .
