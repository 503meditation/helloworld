.PHONY: all deploy clean

all: _site _site/index.html

_site:
	git worktree add _site gh-pages

# Replace this rule with whatever builds your project
_site/index.html: src/index.html
	cp $< $@

deploy: all
	cd _site && \
	git add --all && \
	git commit -m "Deploy to gh-pages" && \
	git push origin gh-pages \
	cd ..

# Removing the actual dist directory confuses git and will require a git worktree prune to fix
clean:
	rm -rf _site/*
