#!/bin/bash

kobol --help

echo -e "## Kobol ##\nKobol is a tool for creating manuals via markdown files." > \
    ~/.config/pearl/var/default/test/markdown/example.md

kobol -P cat example