import Network.Socket
module ApiType where

import Data.Text
import Data.Time (UTCTime)
import Servant.API

main :: IO ()
main = withSocketsDo $ do
    addr <- resolve "http://127.0.0.1:5500/"  -- Resolve the address for port 3000
    sock <- openSocket addr   -- Open a socket using the resolved address
    bind sock (addrAddress addr)  -- Bind the socket to the address
    listen sock 10  -- Listen for incoming connections with a maximum queue of 10

    putStrLn "Server is listening on port http://127.0.0.1:5500/..."

    -- Accept and handle incoming connections
    acceptConnections sock

-- Resolve the address
resolve :: String -> IO AddrInfo
resolve port = do
    let hints = defaultHints { addrFlags = [AI_PASSIVE], addrSocketType = Stream }
    head <$> getAddrInfo (Just hints) Nothing (Just port)

-- Open a socket using the resolved address
openSocket :: AddrInfo -> IO Socket
openSocket addr = do
    sock <- socket (addrFamily addr) (addrSocketType addr) (addrProtocol addr)
    setSocketOption sock ReuseAddr 1
    return sock

-- Accept and handle incoming connections
acceptConnections :: Socket -> IO ()
acceptConnections sock = do
    (clientSock, clientAddr) <- accept sock
    putStrLn $ "Connection from " ++ show clientAddr
    handleConnection clientSock
    acceptConnections sock

-- Handle an incoming connection
handleConnection :: Socket -> IO ()
handleConnection clientSock = do
    msg <- recv clientSock 1024
    putStrLn $ "Received: " ++ show msg
    sendAll clientSock "Hello from the server!"
    close clientSock
