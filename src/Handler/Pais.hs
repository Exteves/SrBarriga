{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Pais where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postPaisInsereR :: Handler Value
postPaisInsereR = do
    pais <- requireJsonBody :: Handler Pais
    pais' <- runDB $ insert pais
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey pais')])
