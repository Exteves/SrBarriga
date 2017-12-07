#!/bin/bash


curl -d '{"nome":"Courtney Cobain", "cartaoId": 4, "nacionalidade":"Brasileira", "cpf":"XXX.XXX XXX-04", "rg":"YY.YYY.YYY-4", "sexo":"F", "email":"courtney@cobain.com", "cnh":"ZZZZZZZZZZ4", "validade":"04/04/2025", "estadoEmissor":"SSP", "senha":"1234"}' -X POST https://haskbeta-romefeller.c9users.io/cliente/inserir 