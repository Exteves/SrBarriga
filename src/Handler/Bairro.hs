{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Bairro where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postBairroInsereR :: Handler Value
postBairroInsereR = do
    bairro <- requireJsonBody :: Handler Bairro
    endereco <- runDB $ insert bairro
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey endereco)])

