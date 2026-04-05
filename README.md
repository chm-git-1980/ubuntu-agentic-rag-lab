
###### ###### 05APR2026
OptiPlex 7050, 8GB RAM, M2000 GPU
Goal is to gain experience and learn Agentic RAG
Previously, RAG configuration was performed on ESXi Server using CPU.
Currently exploring CUDA core for not only RAG, but Agentic RAG.

created ssh key:
~/agentic-rag-lab$ ls -l ~/.ssh/id_ed25519*
-rw------- 1 [AAAA] [BBBB] 411 Apr  5 08:49 /home/AAAA/.ssh/id_ed25519
-rw-r--r-- 1 [AAAA] [BBBB] 102 Apr  5 08:49 /home/AAAA/.ssh/id_ed25519.pub

# Agentic RAG Lab

A local research lab for exploring Agentic Retrieval-Augmented Generation.

## Setup Instructions
1. Clone the repository.
2. Set up the environment.

## To-Do
- [x] Initialze Git
- [x] Configuration SSH key for Git
- [x] Add the Key to your SSH Agent - 0900MT
- [x] Copy the Public Key to GitHub - 0925MT
- [x] Test the Public Key to GitHub Connection  -0925MT
- [ ] Initialize Python environment
- [ ] Install dependencies
- [ ] Connect to Vector DB

###### Background
OptiPlex 7050, 8GB RAM, M2000 GPU
Goal is to gain experience and learn Agentic RAG
Previously, RAG configuration was performed on ESXi Server using CPU.
Currently exploring CUDA core for not only RAG, but Agentic RAG.

###### SSH
created ssh key:
~/agentic-rag-lab$ ls -l ~/.ssh/id_ed25519*
-rw------- 1 [AAAA] [BBBB] 411 Apr  5 08:49 /home/AAAA/.ssh/id_ed25519
-rw-r--r-- 1 [AAAA] [BBBB] 102 Apr  5 08:49 /home/AAAA/.ssh/id_ed25519.pub

###### Git Repository
Step 1: Create a New Repository on GitHub

    Go to GitHub.com and log in.
    In the upper-right corner of any page, use the + drop-down menu and select New repository.
    Give your repository a name (e.g., agentic-rag-lab).
    Keep it set to Public or Private (whichever you prefer).
    Crucial: Leave "Add a README file," "Add .gitignore," and "Choose a license" unchecked. (Since you already initialized your repository locally, creating any of these on GitHub will cause a conflict).

    Click Create repository.

Step 2: Link and Push via Terminal

    Once the repo is created, GitHub will show you a page with some quick setup commands. Since we are using SSH, look for the section that says "…or push an existing repository from the command line".
    Make sure you are in your project directory (cd ~/agentic-rag-lab) and run these three commands:
Bash

# 1. Rename your default branch to 'main' (standard practice)
git branch -M main

# 2. Link your local repo to GitHub using SSH
git remote add origin git@github.com:chm-git-1980/agentic-rag-lab.git

# 3. Push your code up to GitHub
git push -u origin main

    Note: If you are logged in under a different username on that machine, replace chm-git-1980 in the link above with the GitHub username you are currently using.

Step 3: Verify the Upload

Go back to your web browser and refresh your GitHub repository page. You should now see your files listed there instead of the setup instructions!
Next Step: Future updates

Now that the link is established, whenever you make changes to your files in the future, the routine to upload them is much shorter. You will just run:
Bash

git add .
git commit -m "Describe your changes here"
git push

