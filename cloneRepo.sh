# prompt for getting repo name
clear

cat << "EOF"

                      ********** REPO CHECK **********"

.------------------------------------------------------------------------------.
|                  .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                   |
|                 MMMMMMMM'  `"MMMMM"""""""MMMM""`  'MMMMMMMM                  |
|                MMMMMMMMM                           MMMMMMMMM                 |
|               MMMMMMMMMM:                         :MMMMMMMMMM                |
|              .MMMMMMMMMM                           MMMMMMMMMM.               |
|              MMMMMMMMM"                             "MMMMMMMMM               |
|              MMMMMMMMM          O          O         MMMMMMMMM               |
|              MMMMMMMMM                               MMMMMMMMM               |
|              MMMMMMMMMM                             MMMMMMMMMM               |
|              `MMMMMMMMMM                           MMMMMMMMMM`               |
|               MMMMMMMMMMMM.                     .MMMMMMMMMMMM                |
|                MMMMMM  MMMMMMMMMM         MMMMMMMMMMMMMMMMMM                 |
|                 MMMMMM  'MMMMMMM           MMMMMMMMMMMMMMMM                  |
|                  `MMMMMM  "MMMMM           MMMMMMMMMMMMMM`                   |
|                    `MMMMMm                 MMMMMMMMMMMM`                puck |
'------------------------------------------------------------------------------'  

EOF


read -p "Enter Repo name: " repoName

# github account names
usersArr=("student1" "student2" "student3")

# Create empty Arrays
studenstNot=()
studentsAccept=()
studentsSolve=()

#  getting the whole array and go through indexes 
for i in ${!usersArr[@]}; do
    username="${usersArr[i]}"
    echo "Trying to get repo of "${username}""
    
    # clone the repo of the user, before first start add your classroom here
    git clone "git@github.com:<YOURCLASSROOM>/"${repoName}"-"${username}".git"
    

    # check if directory was created and if count commits
    if [ -d "./"${repoName}"-"${username}"" ]
    then 
        commitCount=$(git --git-dir=./"${repoName}"-"${username}"/.git shortlog | grep -E '^[ ]+\w+' | wc -l)
        echo "We have - ${commitCount} commits"
        
        # if to less commits (3 or equal) delete the repo, student did no change anything
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

# Print the result and copy it to result.txt
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
