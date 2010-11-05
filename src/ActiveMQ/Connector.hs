module ActiveMQ.Connector where

import Network.Socket

type IP = String
type Port = PortNumber

data Connection = ActiveMQConnection {socketHandler::Socket}

instance Show Connection where
    show connection = "{ActiveMQConnector socket:" ++ show (socketHandler connection) ++ "}"

connect :: IP -> Port -> IO Connection
connect ip port = do
    s <- socket AF_INET Stream 0
    return $ ActiveMQConnection s