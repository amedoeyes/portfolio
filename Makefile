DIST = dist
MAIN = src/Main.elm
OUTPUT = $(DIST)/script.js

.DEFAULT_GOAL := build

.PHONY: build release watch clean

$(DIST): public/
	mkdir -p $@
	cp -r public/. $@/

$(OUTPUT): $(MAIN) | $(DIST)
	elm make $(MAIN) --output $(OUTPUT) $(ELM_FLAGS)

build: ELM_FLAGS = --debug
build: $(OUTPUT) $(DIST)

release: ELM_FLAGS = --optimize
release: $(OUTPUT) $(DIST)

watch: build
	elm-live $(MAIN) --dir=$(DIST) --open -- --output=$(OUTPUT) --debug

clean:
	rm -rf $(DIST)
