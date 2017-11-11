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
postSeguroInsereR = undefined

getSeguroBuscarR :: SeguroId -> Handler Value
getSeguroBuscarR = undefined