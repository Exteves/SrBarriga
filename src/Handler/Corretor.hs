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
postCorretorInsereR = undefined

getCorretorBuscarR :: CorretorId -> Handler Value
getCorretorBuscarR = undefined

putCorretorAlterarR :: CorretorId -> Handler Value
putCorretorAlterarR = undefined