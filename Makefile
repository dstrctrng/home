SCRIPT := static
BOXNAME := home
RUBY := $(shell which ruby)
RUBY_BIN := $(shell readlink -f $(RUBY) 2>&- || echo $(RUBY))
RUBY_SUFFIX := $(shell basename $(RUBY_BIN) | sed 's/ruby//')
SHOME := $(PWD)
RUNNER := env PATH=$(SHOME)/bin:$(PATH)
BUNDLER := $(SHOME)/bin/bundle

all: ready
	$(BUNDLER) --local --standalone

ready: vendor/ruby/bin/bundle
	@git submodule update --init --recursive
	@$(RUNNER) $(BUNDLER) check --path vendor/bundle 2>&1 >/dev/null || { $(RUNNER) $(BUNDLER) --local --standalone --path vendor/bundle && $(RUNNER) $(BUNDLER) chec --path vendor/bundle; }
	@mkdir -vp bin
	@ln -vnfs "$(shell bundle show alox)/bin/alox"  bin/

$(BOXNAME).box: metadata.json
	tar cvfz $(BOXNAME).box metadata.json

vagrant: $(BOXNAME).box
	vagrant box remove $(BOXNAME) $(SCRIPT) || true
	vagrant box add $(BOXNAME) $(BOXNAME).box

shell:
	vagrant up || true
	vagrant ssh -- -A

vendor/ruby/bin/gem$(RUBY_SUFFIX):
	@cd rubygems-1.8.25 && env GEM_PATH= GEM_HOME=$(SHOME)/vendor/ruby RUBYLIB=$(SHOME)/vendor/ruby/lib $(RUBY) setup.rb --prefix=../vendor/ruby

vendor/ruby/bin/bundle: vendor/ruby/bin/gem$(RUBY_SUFFIX)
	@bin/gem install bundler -v 1.3.5

clean:
	@rm -rf vendor/ruby
