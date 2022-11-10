# Adding here my notes for frequent git cli actions

Some quick notes, mostly to remind myself how to do this. (on machines where I don't have my IDE do the magic for me)


## TOC
* [new branch](#new-branch)
* [push branch](#push-branch)
* [merge dev branch to main](#merge-branch)
* [delete branch](#delete-branch)



## new branch
    
````sh
git branch virshstuff
git checkout virshstuff
````

---


## push branch
    
````sh
git status
git add *
git push --set-upstream origin virshstuff
git add *
git commit -m "added virsh"
````

---


## merge branch
    
````sh
git checkout main 
git status
git merge virshstuff 
git push
````

---


## delete branch 
    
````sh
git branch -d virshstuff 
git push origin :virshstuff 
````

---
