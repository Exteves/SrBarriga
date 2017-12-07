{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Cidade where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCidadeInsereR :: Handler Value
postCidadeInsereR = do
    cidade <- requireJsonBody :: Handler Cidade
    cidid <- runDB $ insert cidade
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cidid)])

{--getCidadeBuscarR :: EnderecoId -> Handler Value
getCidadeBuscarR cidid = do
    cidade <- runDB $ get404 cidid
    sendStatusJSON ok200 (object ["resp" .= (toJSON cidade)])
    --}
