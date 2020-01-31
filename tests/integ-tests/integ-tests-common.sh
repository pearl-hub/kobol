#!/bin/bash

kobol -w

echo -e "## Kobol ##\nKobol is a tool for creating manuals via markdown files." > \
    ~/.local/share/pearl/var/local/test/markdown/example.md

kobol -P cat example
