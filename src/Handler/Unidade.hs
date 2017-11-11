{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Unidade where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postUnidadeInsereR :: Handler Value
postUnidadeInsereR = undefined

getUnidadeBuscarR :: UnidadeId -> Handler Value
getUnidadeBuscarR = undefined

putUnidadeAlterarR :: UnidadeId -> Handler Value
putUnidadeAlterarR = undefined