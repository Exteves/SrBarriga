#!/bin/bash

curl -d '{"corretorId":2,"carroId":2, "dataSaida":"2017-02-01", "dataRetorno":"2017-03-04", "seguroId":1, "clienteId":3}' -X POST https://haskbeta-romefeller.c9users.io/locacao/inserir 