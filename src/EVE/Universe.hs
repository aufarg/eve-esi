{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module EVE.Universe where

import           Data.Aeson
import           EVE.API
import           GHC.Generics
import           Network.HTTP.Simple

data Region = Region { region_id :: Int
                     , name :: String
                     , constellations :: [Int]
                     } deriving (Generic, Show)

instance FromJSON Region where

url :: Request
url = "universe/regions/?datasource=tranquility"

getRegions :: IO [Int]
getRegions = do
    let req = mkRequest path
    response <- httpJSON req
    return (getResponseBody response :: [Int])

    where
        path = "/universe/regions/"

getRegion :: Int -> IO Region
getRegion id = do
    let req = mkRequest path
    response <- httpJSON req
    return (getResponseBody response :: Region)

    where
        path = "/universe/regions/" ++ show id
