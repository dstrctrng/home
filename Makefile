all: ready

ready:
	@git pull
	@git submodule update --init --recursive
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle > /dev/null && bundle check; }

gems:
	@rm -rf .tmp/rubygems
	@mkdir -p .tmp/rubygems
	@tar xvfz vendor/gems/cache/rubygems-1.8.25.tgz -C .tmp/rubygems
	@cd .tmp/rubygems/rubygems-1.8.25 && GEM_HOME=$(HOME)/vendor/gems /usr/bin/ruby setup.rb --prefix=$(HOME)/vendor/gems
	@GEM_HOME=$(HOME)/vendor/gems gem install vendor/gems/cache/bundler-1.2.5.gem
