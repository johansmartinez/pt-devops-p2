#!/usr/bin/env bats

@test "La primera línea de is_prime.sh es correcta" {
  run head -n 1 scripts/is_prime.sh
  [ "$status" -eq 0 ]
  [ "${output}" = "#!/bin/bash" ]
}

@test "Número primo correctamente identificado" {
  run bash scripts/is_prime.sh 7
  [ "$status" -eq 0 ]
  [ "${output}" = "7 es primo" ]
}

@test "Número no primo correctamente identificado" {
  run bash scripts/is_prime.sh 8
  [ "$status" -eq 0 ]
  [ "${output}" = "8 no es primo" ]
}

@test "Número 0 correctamente identificado" {
  run bash scripts/is_prime.sh
  [ "$status" -eq 0 ]
  [ "${output}" = "0 no es primo" ]
}