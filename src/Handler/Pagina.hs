{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module  Handler.Pagina where
import Import
-- PARA VC TER NO HTML HASKELL
-- USA-SE OS SHAKESPEREAN TEMPLATES
-- HAMLET -> HTML
-- LUCIUS OU CASSIUS -> CSS
-- JULIUS -> Javascript
-- CASO ESTIVERMOS USANDO O SHAKESPEREAN TEMPLATES
-- TODO HTML/CSS/JAVASCIPRT IRA PARA DENTRO DO EXECUTÁVEL
getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do 
        [whamlet|
            <h1> Ola mundo
            
        |]