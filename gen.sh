#!/bin/sh
rm mono/*.ttf
rm *.ttf
for font in orig/*
do
    BOLD=""
    TMP="${font#orig/lmroman}"
    SIZE="${TMP%-*}"
    case "$font" in
        *bold*)
            BOLD=" Bold";;
    esac

    #echo $file $SIZE
    python monospaci.py/monospaci.py \
        -psname "TeX<3 ${SIZE}pt Mono${BOLD}" \
        -familyname "TeX<3" \
        -fullname "TeX<3 ${SIZE}pt Mono${BOLD}" \
        -nameslist monospaci.py/NamesList.txt \
        $font
done
rm TTFAutoHint-Input.ttf
for file in *ttf;
do
    # can't have '<' as filename on Windows
    mv ${file} mono/${file/<3/Love}
done

