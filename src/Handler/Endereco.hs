{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Endereco where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getCepBuscarR :: Text -> Handler Value
getCepBuscarR = undefined

postEnderecoInsereR :: Handler Value
postEnderecoInsereR = do
    endereco <- requireJsonBody :: Handler Endereco
    cepid <- runDB $ insert endereco
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cepid)])

getEnderecoBuscarR :: EnderecoId -> Handler Value
getEnderecoBuscarR cepid = do
    endereco <- runDB $ get404 cepid
    sendStatusJSON ok200 (object ["resp" .= (toJSON endereco)])

putEnderecoAlterarR :: EnderecoId -> Handler Value
putEnderecoAlterarR = undefined