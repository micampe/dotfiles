#!/usr/bin/env bash

curl --output Input-Font.zip --clobber --output-dir "$TMPDIR" \
  "https://input.djr.com/build/?basic=1&fontSelection=whole&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=height&braces=straight&line-height=1.1&accept=I+do"
unzip -o "$TMPDIR"/Input-Font.zip -d "$TMPDIR"/Input-Font

for N in Mono Sans Serif
do
  ditto -v \
    "$TMPDIR"/Input-Font/Input_Fonts/Input"$N"/Input"$N" \
    ~/Library/Fonts/Input"$N"
done
