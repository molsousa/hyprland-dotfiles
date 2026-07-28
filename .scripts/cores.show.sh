#!/bin/bash

for code in {000..255}; do 
	printf "\033[38;5;${code}m%s\033[0m\n" "$code: Cor"
done
