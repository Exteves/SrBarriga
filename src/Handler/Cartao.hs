{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Cartao where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCartaoInsereR :: CartaoId -> Handler Value
postCartaoInsereR = undefined

getCartaoBuscarR :: CartaoId -> Handler Value
getCartaoBuscarR = undefined

deleteCartaoApagarR :: CartaoId -> Handler Value
deleteCartaoApagarR = undefined

putCartaoAlterarR :: CartaoId -> Handler Value
putCartaoAlterarR = undefined