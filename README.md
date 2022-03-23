# Student Github Repo Checker

### About
This little hacky bash script asks you for a name of an classroom exercise and clones in the current folder those student repos, that have already changes which have been pushed. So you have a collection of the repos you wanne check. For helping you with your classbook it returns a list of your students who: 
    a) did not started with the exercise (the repo was not build yet) 
    b) did not push their changes
    c) pushed the changes  


### Preparation
- Add the github account names of your students inside the `usersArr` 
- make the script executable
- if you llike make it globally available to start it from everywhere or copy it inside a folder where you wanne have the cloned repos and start from there



### How it works

As said before it is a very hacky way to avoid the annoying gh classroom clickbait. Following steps are done:
1. it clones every repo of the given exercise
2. it checks how many commits are done, if there are no changes 3 commits are printed (while testing it was ok, but it is not the best way)  
3. if there are too less commits the repo is deleted again
4. student.txt is created with the informations collected while the steps before