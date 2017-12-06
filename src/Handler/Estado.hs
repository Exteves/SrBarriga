{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Estado where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postEstadoInsereR :: Handler Value
postEstadoInsereR = do
    estado <- requireJsonBody :: Handler Estado
    est <- runDB $ insert estado
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey est)])

{--getEstadoBuscarR :: EstadoId -> Handler Value
getEnderecoBuscarR est = do
    estado <- runDB $ get404 est
    sendStatusJSON ok200 (object ["resp" .= (toJSON estado)])--}
