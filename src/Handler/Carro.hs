{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Carro where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCarroInsereR :: CarroId -> Handler Value
postCarroInsereR = undefined

getCarroBuscarR :: CarroId -> Handler Value
getCarroBuscarR = undefined

deleteCarroApagarR :: CarroId -> Handler Value
deleteCarroApagarR = undefined

putCarroAlterarR :: CarroId -> Handler Value
putCarroAlterarR = undefined