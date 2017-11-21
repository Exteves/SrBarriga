{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Cartao where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCartaoInsereR :: Handler Value
postCartaoInsereR = do
    cartao <- requireJsonBody :: Handler Cartao
    cardid <- runDB $ insert cartao
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cardid)])
    
getCartaoBuscarR :: CartaoId -> Handler Value
getCartaoBuscarR cardid = do
    cartao <- runDB $ get404 cardid
    sendStatusJSON ok200 (object ["resp" .= (toJSON cartao)])

putCartaoAlterarR :: CartaoId -> Handler Value
putCartaoAlterarR = undefined