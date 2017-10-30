{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Corretor where

import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postCorretorInsereR :: CorretorId -> Handler Value
postCorretorInsereR = undefined

getCorretorBuscarR :: CorretorId -> Handler Value
getCorretorBuscarR = undefined

deleteCorretorApagarR :: CorretorId -> Handler Value
deleteCorretorApagarR = undefined

putCorretorAlterarR :: CorretorId -> Handler Value
putCorretorAlterarR = undefined