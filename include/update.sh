#!/bin/sh
rm -rf allegro5
cp -a /usr/include/allegro5 .
for i in `find allegro5 -iname '*.h'`; do
	sed -i 's/\bbool\b/int/g' $i
	sed -i 's/\bintptr_t\b/void */g' $i
done
