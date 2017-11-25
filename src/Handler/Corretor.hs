{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Corretor where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCorretorInsereR :: Handler Value
postCorretorInsereR = do
    corretor <- requireJsonBody :: Handler Corretor
    corid <- runDB $ insert corretor
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey corid)])

getCorretorBuscarR :: CorretorId -> Handler Value
getCorretorBuscarR corid = do
    corretor <- runDB $ get404 corid
    sendStatusJSON ok200 (object ["resp" .= (toJSON corretor)])

putCorretorAlterarR :: CorretorId -> Handler Value
putCorretorAlterarR = undefined