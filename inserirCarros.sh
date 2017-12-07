#!/bin/bash

curl -d '{"placa" : "HGD-6543", "modelo" : "Honda Fit", "ano" : "2017" , "tanqueCheio" : true, "km" : "1.760", "vlDiaria" : "R$ 90,00", "alugado" : false }' -X POST https://haskbeta-romefeller.c9users.io/carro/inserir 
