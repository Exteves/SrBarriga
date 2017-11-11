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
    cid <- runDB $ insert cartao
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cid)])
    
getCartaoBuscarR :: CartaoId -> Handler Value
getCartaoBuscarR = undefined

putCartaoAlterarR :: CartaoId -> Handler Value
putCartaoAlterarR = undefined