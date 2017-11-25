{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Carro where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCarroInsereR :: Handler Value
postCarroInsereR = do
    carro <- requireJsonBody :: Handler Carro
    carid <- runDB $ insert carro
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey carid)])

getCarroBuscarR :: CarroId -> Handler Value
getCarroBuscarR carid = do
    carro <- runDB $ get404 carid
    sendStatusJSON ok200 (object ["resp" .= (toJSON carro)])

putCarroAlterarR :: CarroId -> Handler Value
putCarroAlterarR carid = do
    _ <- runDB $ get404 carid
    novoCarro <- requireJsonBody :: Handler Carro
    runDB $ replace carid novoCarro
    sendStatusJSON noContent204 (object ["resp" .= (fromSqlKey carid)])