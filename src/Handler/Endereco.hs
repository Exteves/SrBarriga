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
getCepBuscarR cep = do
    cepList <- runDB $ selectList [EnderecoCep==.cep][]
    sendStatusJSON ok200(object ["resp".= (toJSON cepList)])

postEnderecoInsereR :: Handler Value
postEnderecoInsereR = do
    endereco <- requireJsonBody :: Handler Endereco
    cep <- runDB $ insert endereco
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cep)])

getEnderecoBuscarR :: EnderecoId -> Handler Value
getEnderecoBuscarR cep = do
    endereco <- runDB $ get404 cep
    sendStatusJSON ok200 (object ["resp" .= (toJSON endereco)])

putEnderecoAlterarR :: EnderecoId -> Handler Value
putEnderecoAlterarR cep = do
    _ <- runDB $ get404 cep
    novoEndereco <- requireJsonBody :: Handler Endereco
    runDB $ replace cep novoEndereco
    sendStatusJSON noContent204 (object ["resp" .= (fromSqlKey cep)])