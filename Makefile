SCRIPT := static
BOXNAME := home
RUBY := ruby
BUNDLE := bundle

all: ready
	$(BUNDLE) --local --standalone

ready:
	@git submodule update --init --recursive
	@$(BUNDLE) check 2>&1 >/dev/null || { $(BUNDLE) --local --standalone --path vendor/bundle && $(BUNDLE) check; }
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

vendor/ruby/bin/gem:
	@cd rubygems-1.8.25 && env GEM_PATH= GEM_HOME=$(PWD)/vendor/ruby $(RUBY) setup.rb --prefix=../vendor/ruby

vendor/ruby/bin/bundle: vendor/ruby/bin/gem
	@bin/gem install bundler -v 1.3.5

clean:
	@rm -rf vendor/ruby
