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
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey loc)])

getLocacaoCarroBuscarR :: CarroId -> Handler Value
getLocacaoCarroBuscarR = undefined

getLocacaoClienteBuscarR :: ClienteId -> Handler Value
getLocacaoClienteBuscarR cid = do
    cliente <- runDB $ get404 cid
    sendStatusJSON ok200 (object ["resp" .= (toJSON cliente)])

getLocacaoCartaoBuscarR :: CartaoId -> Handler Value
getLocacaoCartaoBuscarR cardid = do
    cartao <- runDB $ get404 cardid
    sendStatusJSON ok200 (object ["resp" .= (toJSON cartao)])

getLocacaoCorretorBuscarR :: CorretorId -> Handler Value
getLocacaoCorretorBuscarR corid = do
    corretor <- runDB $ get404 corid
    sendStatusJSON ok200 (object ["resp" .= (toJSON corretor)])

getLocacaoRetornoBuscarR :: UTCTime -> Handler Value
getLocacaoRetornoBuscarR retorno = do
    retList <- runDB $ selectFirst [LocacaoDataRetorno==.retorno][]
    sendStatusJSON ok200(object ["resp".= (toJSON retList)])
    
getLocacaoSaidaBuscarR :: UTCTime -> Handler Value
getLocacaoSaidaBuscarR saida = do
    saidaList <- runDB $ selectFirst [LocacaoDataSaida==.saida][]
    sendStatusJSON ok200(object ["resp".= (toJSON saidaList)])