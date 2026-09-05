DIST = dist
MAIN = src/Main.elm
OUTPUT = $(DIST)/script.js

.DEFAULT_GOAL := build

.PHONY: build release watch clean

$(DIST):
	mkdir -p $@
	cp -r public/. $@/

build: | $(DIST)
	elm make $(MAIN) --output $(OUTPUT) --debug

release: | $(DIST)
	elm make $(MAIN) --output $(OUTPUT) --optimize

watch: build
	elm-live $(MAIN) --dir=$(DIST) --open -- --output=$(OUTPUT) --debug

clean:
	rm -rf $(DIST)
