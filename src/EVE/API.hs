{-# LANGUAGE OverloadedStrings #-}

module EVE.API(mkRequest) where

import qualified Data.ByteString.Char8 as S8
import           Network.HTTP.Simple

apiUrl :: Request
apiUrl = "https://esi.evetech.net"

apiVersion :: String
apiVersion = "latest"

datasource = "tranquility"

mkRequest :: String -> Request
mkRequest path = setRequestPath (S8.pack $ "/" ++ apiVersion ++ path)
               $ setRequestQueryString [("datasource", Just datasource)]
               $ apiUrl

