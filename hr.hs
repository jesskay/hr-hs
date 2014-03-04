import System.Environment (getArgs)
import System.IO (hGetContents)
import System.Process (CreateProcess(..), StdStream(..), createProcess, proc)

cmdOutput cmd args = do
    (_, maybeHOut, _, _) <-
        createProcess (proc cmd args){ std_out = CreatePipe }
    case maybeHOut of
        Nothing   -> return ""
        Just hOut -> hGetContents hOut

termWidth = do
    let fallbackWidth = 80
    width <- cmdOutput "tput" ["cols"]
    case width of
        "" -> return fallbackWidth
        w  -> case reads w of
                       [] -> return fallbackWidth
                       xs -> return . fst . head $ xs

makeLine width = take width . concat . repeat

main = do
    args <- getArgs
    let linePatterns = if null args
                       then ["#"]
                       else args
    width <- termWidth
    mapM_ (putStrLn . makeLine width) linePatterns
