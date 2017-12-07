{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Locacao where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postLocacaoInsereR :: Handler Value
postLocacaoInsereR = do
    locacao <- requireJsonBody :: Handler Locacao
    loc <- runDB $ insert locacao
    sendStatusJSON created201 (object ["Inserção feita no Id" .= (fromSqlKey loc)])

getLocacaoCarroBuscarR :: CarroId -> Handler Value
getLocacaoCarroBuscarR carid = do
    carro <- runDB $ get404 carid
    sendStatusJSON ok200 (object ["Busca pelo Id do Carro" .= (toJSON carro)])

getLocacaoClienteBuscarR :: ClienteId -> Handler Value
getLocacaoClienteBuscarR cid = do
    cliente <- runDB $ get404 cid
    sendStatusJSON ok200 (object ["Busca pelo Id do Cliente" .= (toJSON cliente)])

getLocacaoCartaoBuscarR :: CartaoId -> Handler Value
getLocacaoCartaoBuscarR cardid = do
    cartao <- runDB $ get404 cardid
    sendStatusJSON ok200 (object ["Busca pelo Id do Cartao" .= (toJSON cartao)])

getLocacaoCorretorBuscarR :: CorretorId -> Handler Value
getLocacaoCorretorBuscarR corid = do
    corretor <- runDB $ get404 corid
    sendStatusJSON ok200 (object ["Busca pelo Id do Corretor" .= (toJSON corretor)])

getLocacaoRetornoBuscarR :: Day -> Handler Value
getLocacaoRetornoBuscarR retorno = do
    retList <- runDB $ selectFirst [LocacaoDataRetorno==.retorno][]
    sendStatusJSON ok200(object ["Busca por data de Retorno".= (toJSON retList)])
    
getLocacaoSaidaBuscarR :: Day -> Handler Value
getLocacaoSaidaBuscarR saida = do
    saidaList <- runDB $ selectFirst [LocacaoDataSaida==.saida][]
    sendStatusJSON ok200(object ["Busca por data de Saida".= (toJSON saidaList)])