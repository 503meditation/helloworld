## Setup

```
$ rm -rf dist
$ echo "_site/" >> .gitignore
$ git worktree add _site gh-pages
```

## Making changes

```
$ make # or what ever you run to populate _site
$ cd _site
$ git add --all
$ git commit -m "Deploy to gh-pages"
$ git push origin gh-pages
$ cd ..
```

### Notes

git worktree feature has its own garbage collection so if dist is deleted it will not affect much and can be recreated as needed. If you want it to go away you can use git worktree prune See man pages on it.

### Makefile

To make this stream line the following Makefile can be used to automate this process:

```
.PHONY: all deploy clean

all: dist dist/index.html

dist:
	git worktree add dist gh-pages

# Replace this rule with whatever builds your project
dist/index.html: src/index.html
	cp $< $@

deploy: all
	cd dist && \
	git add --all && \
	git commit -m "Deploy to gh-pages" && \
	git push origin gh-pages

# Removing the actual dist directory confuses git and will require a git worktree prune to fix
clean:
	rm -rf dist/*
```
