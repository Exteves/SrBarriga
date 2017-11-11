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
    carro <- requireJsonBody :: Handler Cliente
    cid <- runDB $ insert carro
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cid)])

getCarroBuscarR :: CarroId -> Handler Value
getCarroBuscarR = undefined

putCarroAlterarR :: CarroId -> Handler Value
putCarroAlterarR = undefined