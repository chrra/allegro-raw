#!/bin/sh
rm -rf allegro5
cp -a /usr/include/allegro5 .
for i in `find allegro5 -iname '*.h'`; do
	for x in `sed -n 's/^typedef enum \w* \(\w*\);/\1/p' $i`; do
		sed -i '/enum/!s/\b'$x'\b/int/g' $i
	done
	sed -i '/^typedef enum.*;/d' $i
	sed -i 's/\bbool\b/int/g' $i
	sed -i 's/\bintptr_t\b/void */g' $i
	sed -i 's/\buintptr_t\b/void */g' $i
done
