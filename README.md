# Student Github Repo Checker

### About
This little hacky bash checks a classroom exercise and clones those student repos, that have already pushed changes. So you get a collection of the repos you wanne check. In addition it returns a list of your students who: 
a) did not started with the exercise (the repo was not build yet) 
b) did not push their changes
c). pushed the changes  
as a .txt file. Everything will be done in the current folder you are in.

### Preparation
- in line 32 -> add the github account names of your students inside the `usersArr` 
- in line 45 -> add your class organisation in the url
- make the script executable
- if you llike make it globally available to start it from everywhere or copy it inside a folder where you wanne have the cloned repos and start from there



### How it works

As said before it is a very hacky way to avoid the annoying gh classroom clickbait. Following steps are done:
1. it clones every repo of the given exercise
2. it checks how many commits are done, normally there are 3 commits if no changes were done by the students (*Initial commit, Github Classroom Feedback, Setting up Github Classroom Feedback - this is probably not 100%, just saying ;-)*)  
3. if there are too less commits the repo is deleted again
4. student.txt is created with the informations collected...
