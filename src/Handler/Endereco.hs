{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Endereco where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getCepBuscarR :: Text -> Handler Value
getCepBuscarR = undefined

postEnderecoInsereR :: Handler Value
postEnderecoInsereR = undefined

getEnderecoBuscarR :: EnderecoId -> Handler Value
getEnderecoBuscarR = undefined

putEnderecoAlterarR :: EnderecoId -> Handler Value
putEnderecoAlterarR = undefined