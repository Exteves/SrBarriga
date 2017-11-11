{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Cliente where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postClienteInsereR :: Handler Value
postClienteInsereR = do
    cliente <- requireJsonBody :: Handler Cliente
    cid <- runDB $ insert cliente
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cid)])


-- select *from Cliente where id = cid
getBuscarR :: ClienteId -> Handler Value
getBuscarR cid = do
    cliente <- runDB $ get404 cid
    sendStatusJSON ok200 (object ["resp" .= (toJSON cliente)])


putAlteraR :: ClienteId -> Handler Value
putAlteraR cid = do
    _ <- runDB $ get404 cid
    novoCliente <- requireJsonBody :: Handler Cliente
    runDB $ replace cid novoCliente
    sendStatusJSON noContent204 (object ["resp" .= (fromSqlKey cid)])
    
patchAlteraNomeR :: ClienteId -> Handler Value
patchAlteraNomeR cid = do
    _ <- runDB $ get404 cid
    nome <- requireJsonBody :: Handler Text
    runDB $ update cid [ClienteNome =. nome]
    sendStatusJSON noContent204 (object ["resp" .= (fromSqlKey cid)])