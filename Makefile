SCRIPT := static
RUBY := $(shell which ruby)
RUBY_BIN := $(shell readlink -f $(RUBY) 2>&- || echo $(RUBY))
RUBY_SUFFIX := $(shell basename $(RUBY_BIN) | sed 's/ruby//')
SHOME := $(PWD)
RUNNER := env PATH=$(SHOME)/bin:$(PATH)
BUNDLER := bundle

all: ready

ready:
	@git submodule update --init --recursive
	@$(RUNNER) $(BUNDLER) check --path vendor/bundle 2>&1 >/dev/null || { $(RUNNER) $(BUNDLER) --local --standalone --path vendor/bundle && $(RUNNER) $(BUNDLER) chec --path vendor/bundle; }
	@mkdir -vp bin
	@ln -vnfs "$(shell bundle show alox)/bin/alox" bin/
	@cd .junas && script -c "make" /dev/null
