-- NetworkManager.hs
module NetworkManager where

-- Import necessary modules
import Network.Simple.TCP (HostName, ServiceName, connect, listen, accept, close, send, recv)
import System.Random (randomRIO)
import System.Time (getCurrentTime)

-- Define types for transactions and peers
type Tx = Int

data Peer = Peer HostName ServiceName
    deriving (Show, Read, Eq, Ord)

data Message = Connect HostName ServiceName
             | GetPeers
             | Status [Peer]
             | Newtx Tx
             | Oldtx Tx Tx
             | Quit
             | Unknown String
             deriving (Show, Read)

-- Function to establish connection to a peer
connectToPeer :: Peer -> IO ()
connectToPeer (Peer host port) = do
    putStrLn "Connecting..."
    connect host port $ \(socket, _) -> do
        putStrLn "Connected!"
        close socket

-- Function to start listening on a specified port and handle new connections
startListening :: ServiceName -> (Peer -> IO ()) -> IO ()
startListening port onConnect = do
    putStrLn "Listening..."
    listen "127.0.0.1" port $ \(socket, _) -> do
        (host, port) <- getSockName socket
        onConnect (Peer host port)
        close socket

-- Function to get the host name and port number of a socket
getSockName :: Socket -> IO (HostName, ServiceName)
getSockName socket = do
    (host, port) <- getPeerName socket
    return (host, show port)


-- PeerManager.hs
module PeerManager where

-- Import the Peer data type from NetworkManager
import NetworkManager (Peer)

-- Define a type for a list of peers
type Peers = [Peer]

-- Function to add a unique peer to the list of peers
addPeerUnique :: Peer -> Peers -> Peers
addPeerUnique peer peers
    | peer `elem` peers = peers -- Peer already exists
    | otherwise         = peer : peers

-- Function to remove a unique peer from the list of peers
removePeerUnique :: Peer -> Peers -> Peers
removePeerUnique peer peers = filter (/= peer) peers


-- MessageHandler.hs
module MessageHandler where

-- Import the Peer data type from NetworkManager
import NetworkManager (Peer)

-- Function to handle different types of messages
handleMessageUnique :: Message -> Peers -> IO ()
handleMessageUnique (Connect host port) peers = do
    let newPeer = Peer host port
    let updatedPeers = addPeerUnique newPeer peers
    putStrLn "New connection established!"
    print updatedPeers

handleMessageUnique GetPeers peers = do
    putStrLn "Sending peers list..."
    sendPeersUnique peers

handleMessageUnique (Status peerList) peers = do
    putStrLn "Received peers list:"
    print peerList


-- TransactionHandling.hs
module TransactionHandling where

-- Import the Peer data type from NetworkManager
import NetworkManager (Peer)

-- Function to generate a new random transaction
generateNewTransactionUnique :: IO Tx
generateNewTransactionUnique = randomRIO (1, 10)

-- Function to propagate a transaction to a list of peers
propagateTransactionUnique :: Tx -> Peers -> IO ()
propagateTransactionUnique tx peers = do
    putStrLn "Propagating transaction..."
    mapM_ (\(Peer host port) -> connectToPeerUnique host port $ \socket -> send socket $ show (Newtx tx)) peers

-- Function to handle an incoming transaction
handleIncomingTransactionUnique :: Tx -> Peers -> IO ()
handleIncomingTransactionUnique tx peers = do
    putStrLn "Received transaction!"
    -- Check if transaction is valid and handle accordingly


-- Logging.hs
module Logging where

-- Import necessary modules
import System.Time (getCurrentTime)

-- Function to log a transaction with a timestamp
logTransactionUnique :: Tx -> IO ()
logTransactionUnique tx = do
    timestamp <- getCurrentTime
    putStrLn $ "[" ++ show timestamp ++ "] Transaction: " ++ show tx


-- ErrorHandler.hs
module ErrorHandler where

-- Function to handle errors and print error message
handleErrorUnique :: String -> IO ()
handleErrorUnique errorMsg = putStrLn $ "Error: " ++ errorMsg


-- Main.hs
module Main where

-- Import necessary modules and functions
import NetworkManager (connectToPeer, startListening, getSockName)
import PeerManager (addPeerUnique, removePeerUnique)
import MessageHandler (handleMessageUnique)
import TransactionHandling (generateNewTransactionUnique, propagateTransactionUnique, handleIncomingTransactionUnique)
import Logging (logTransactionUnique)
import ErrorHandler (handleErrorUnique)

-- Main function to start the P2P protocol
mainUnique :: IO ()
mainUnique = do
    -- Listen on port 8000 and handle new connections
    startListening "8000" onConnectUnique

    -- Connect to host at 127.0.0.1:9000
    connectToPeerUnique (Peer "127.0.0.1" "9000")

    putStrLn "P2P Protocol Started"

-- Function to handle a new connection
onConnectUnique :: Peer -> IO ()
onConnectUnique peer = do
    -- Handle new connection
    -- For example, you may send a GetPeers message to the new peer
    -- and update your list of known peers
    putStrLn $ "Connected to " ++ show peer
