# Pull submodule for the first time e.g. after cloning the repo
git submodule update --init # --recursive
# Update the submodule to the latest commit
git submodule update --remote --merge

# Preview deployment
hugo server -D