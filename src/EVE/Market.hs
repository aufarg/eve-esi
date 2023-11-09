{-# LANGUAGE OverloadedStrings #-}

module EVE.Market where

import           Data.Aeson
import qualified Data.ByteString.Char8 as S8
import           Network.HTTP.Simple

getRegionOrders :: IO [String]
getRegionOrders = do
    response <- httpJSON "http://httpbin.org/get"
    return $ (getResponseBody response :: [String])
