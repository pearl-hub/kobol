#!/bin/bash

kobol -w

echo -e "## Kobol ##\nKobol is a tool for creating manuals via markdown files." > \
    ~/.config/pearl/var/default/test/markdown/example.md

kobol -P cat example

pearl update test

pearl remove test
