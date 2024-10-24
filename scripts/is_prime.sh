#!/bin/bash

number=${1:-0}
is_prime=1

if [ "$number" -lt 2 ]; then
    is_prime=0
else
    for ((i=2; i<=$((number / 2)); i++)); do
        if (( number % i == 0 )); then
            is_prime=0
            break
        fi
    done
fi

if (( is_prime == 1 )); then
    echo "$number es primo"
else
    echo "$number no es primo"
fi
