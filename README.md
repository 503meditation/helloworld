# (づ￣ ³￣)づ

https://gurumeditation.zone

## Jekyll

Static site generation handled by [Jeykll](https://jekyllrb.com/), check there for further command level docs

### Developer Notes

use `bundle exec jekyll serve` to develop locally, then when ready to publish use `bundle exec jekyll build` to create `_site` folder for use in `gh-pages` branch which will be published live to production

### New Setup

- Clone this repo locally, pref using SSH
- Install dependencies: xcode, homebrew, jekyll, ruby bundler
```bash
$ gem install bundler jekyll
$ cd /helloworld/
$ bundle install
```
- `jekyll serve` to build the `_site` folder and deploy website to local server @ http://127.0.0.1:4000
or
- `jekyll build` to only build the `_site` folder

## Publish New Build to Pages

make changes to master and use `jekyll build` to generate new `_site` folder

which is automating the following commands, which can be achieved manually:

```bash
$ cd _site
$ git add --all
$ git commit -m "Deploy to gh-pages"
$ git push origin gh-pages
$ cd ..
```

## Config File

This config file is meant for settings that affect your whole blog, values which you are expected to set up once and rarely edit after that. If you find yourself editing this file very often, consider using Jekyll's data files feature for the data you need to update frequently.

For technical reasons, this file is _NOT_ reloaded automatically when you use `bundle exec jekyll serve`. If you change this file, please restart the server process.

### Site Settings

These are used to personalize your new site. If you look in the HTML files, you will see them accessed via {{ site.title }}, {{ site.email }}, and so on. You can create any custom variable you would like, and they will be accessible in the templates via {{ site.myvariable }}.

- title: Guru Meditation
- email: your-email@example.com
- description: >- # this means to ignore newlines until "baseurl:" Write an awesome description for your new site here. You can edit this line in \_config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description
- baseurl: "gurumeditation" # the subpath of your site, e.g. /blog
- url: "" # the base hostname & protocol for your site, e.g. http://example.com
- twitter_username: jekyllrb
- github_username: jekyll

#### Exclude from Processing

The following items will not be processed, by default. Create a custom list to override the default setting. exclude:

- Gemfile
- Gemfile.lock
- node_modules
- vendor/bundle/
- vendor/cache/
- vendor/gems/
- vendor/ruby/

## New Posts

To add new posts, simply add a file in the \_posts directory that follows the convention YYYY-MM-DD-name-of-post.ext and includes the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

```
{% highlight ruby %}
def print_hi(name)
puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}
```

#### Notes

i'm checked into master in `../helloworld/` root folder and checked into gh-pages branch on `../helloworld/_site`

`git worktree` feature has its own garbage collection so if `_site` is deleted it will not affect much and can be recreated as needed. If you want it to go away you can use `git worktree prune`, see main pages on it.

#### Makefile (TODO)

To make this stream line the following Makefile can be used to automate this process:

```makefile
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
