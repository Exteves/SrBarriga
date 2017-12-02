{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Unidade where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postUnidadeInsereR :: Handler Value
postUnidadeInsereR = do
    unidade <- requireJsonBody :: Handler Unidade
    unid <- runDB $ insert unidade
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey unid)])

getUnidadeBuscarR :: UnidadeId -> Handler Value
getUnidadeBuscarR unid = do
    unidade <- runDB $ get404 unid
    sendStatusJSON ok200 (object ["resp" .= (toJSON unidade)])

putUnidadeAlterarR :: UnidadeId -> Handler Value
putUnidadeAlterarR unid = do
    _ <- runDB $ get404 unid
    novaUnidade <- requireJsonBody :: Handler Unidade
    runDB $ replace unid novaUnidade
    sendStatusJSON noContent204 (object ["resp" .= (fromSqlKey unid)])