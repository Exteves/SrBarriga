{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Locacao where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postLocacaoInsereR :: Handler Value
postLocacaoInsereR = undefined

getLocacaoCarroBuscarR :: CarroId -> Handler Value
getLocacaoCarroBuscarR = undefined

getLocacaoClienteBuscarR :: ClienteId -> Handler Value
getLocacaoClienteBuscarR = undefined

getLocacaoCartaoBuscarR :: CartaoId -> Handler Value
getLocacaoCartaoBuscarR = undefined

getLocacaoCorretorBuscarR :: CorretorId -> Handler Value
getLocacaoCorretorBuscarR = undefined

getLocacaoSaidaBuscarR :: UTCTime -> Handler Value
getLocacaoSaidaBuscarR = undefined

getLocacaoRetornoBuscarR :: UTCTime -> Handler Value
getLocacaoRetornoBuscarR = undefined
