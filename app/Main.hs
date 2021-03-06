module Main where

import Control.Monad.Trans
import System.Console.Haskeline

import Syntax
import Parser
import Check
import Eval
import Pretty

process :: String -> IO ()
process line = do
    let res = parseExpr line
    case res of
        Left err -> print err
        Right ex -> do
            let chk = checkTop [] ex
            case chk of
                Left tyerr -> print tyerr
                Right _ -> print $ runEval ex

main :: IO ()
main = runInputT defaultSettings loop
    where 
    loop = do
        minput <- getInputLine "λ> " 
        case minput of 
            Nothing -> outputStrLn "Goodbye."
            Just input -> (liftIO $ process input) >> loop

