RUBY := /usr/bin/ruby
SCRIPT := static
BOXNAME := home
RUBY := /usr/bin/ruby
BUNDLER := $(shell which bundle 2>&1 || echo vendor/ruby/bin/bundle)

all: ready
	$(BUNDLER) --local --standalone

ready: $(BUNDLER)
	@git submodule update --init --recursive
	@$(BUNDLER) check 2>&1 >/dev/null || { $(BUNDLER) --local --standalone --path vendor/bundle && $(BUNDLER) check; }
	@mkdir -p bin
	@ln -nfs "$(shell bundle show alox)/bin/alox"  bin/

$(BOXNAME).box: metadata.json
	tar cvfz $(BOXNAME).box metadata.json

vagrant: $(BOXNAME).box
	vagrant box remove $(BOXNAME) $(SCRIPT) || true
	vagrant box add $(BOXNAME) $(BOXNAME).box

shell:
	vagrant up || true
	vagrant ssh -- -A

vendor/ruby/bin/bundle: vendor/ruby/bin/gem
	@bin/gem install bundler -v 1.3.5

vendor/ruby/bin/gem:
	@cd rubygems-1.8.25 && env GEM_PATH= GEM_HOME=$(PWD)/vendor/ruby $(RUBY) setup.rb --prefix=../vendor/ruby

clean:
	@rm -rf vendor/ruby
