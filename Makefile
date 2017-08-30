all: lib.dylib program

lib.dylib: lib.cr
	crystal build --link-flags "-dynamiclib" -o lib.dylib lib.cr

program: program.cr
	crystal build -o program program.cr

run: all
	./program

clean:
	rm -f lib.dylib program

.PHONY: run clean
