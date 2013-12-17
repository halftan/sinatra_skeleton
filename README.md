## Sinatra Skeleton

### How to build a development env
----------------

1. Install [rbenv](https://github.com/sstephenson/rbenv) **Follow the instructions**
2. Install [ruby-build](https://github.com/sstephenson/ruby-build)
3. Download `ruby-2.0.0-p247 source code` from [this mirror site](ruby.taobao.com) or [click here](http://ruby.taobao.org/mirrors/ruby/2.0/ruby-2.0.0-p247.tar.gz)
4. Create `~/.rbenv/cache` by `mkdir ~/.rbenv/cache` and move the tarball just downloaded in it.
5. Fire it up! `rbenv install 2.0.0-p247`
6. Change gem source to a fast mirror-site

		$ gem sources --remove https://rubygems.org/
		$ gem sources -a http://ruby.taobao.org/

8. `vim ~/.gemrc` and add the following

		gem: --no-ri --no-rdoc

7. And install bundler

		$ gem install bundler

8. Checkout the git repo, cd into it, and

		$ bundle install
	**Do not forget `rbenv rehash` before this**


### Directory structure

* **config**

	config files and init scripts
* **models**

	models definition
* **views** 

	view template (using slim)
* **spec**  

	test specs
* **helper**

	helper scripts are defined here
* **routes**

	scripts here will be loaded by `app.rb`, defines url routes
