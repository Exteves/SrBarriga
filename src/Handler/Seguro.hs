{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Seguro where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postSeguroInsereR :: Handler Value
postSeguroInsereR = do
    seguro <- requireJsonBody :: Handler Seguro
    segid <- runDB $ insert seguro
    sendStatusJSON created201 (object ["Inserção no Id" .= (fromSqlKey segid)])

getSeguroBuscarR :: SeguroId -> Handler Value
getSeguroBuscarR segid = do
    seguro <- runDB $ get404 segid
    sendStatusJSON ok200 (object ["retorno da requisição" .= (toJSON seguro)])