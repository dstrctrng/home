RUBY := /usr/bin/ruby

BUNDLE := 

all: ready

ready:
	@git submodule update --init --recursive
	@$(BUNDLE)bundle check 2>&1 >/dev/null || { $(BUNDLE)bundle --local --path vendor/bundle && $(BUNDLE)bundle check; }

vendor/ruby/bin/ruby:
	@cd rubygems-1.8.25 && env GEM_PATH= GEM_HOME=$(PWD)/vendor/ruby $(RUBY) setup.rb --prefix=../vendor/ruby
	@bin/gem install bundler -v 1.3.5

rubygems: vendor/ruby/bin/ruby
	@$(MAKE) BUNDLE=bin/
