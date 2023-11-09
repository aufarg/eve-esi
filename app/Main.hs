module Main (main) where

import EVE.Universe

main :: IO ()
main = do
    regionIds <- getRegions
    regions <- mapM getRegion regionIds
    mapM_ print regions
