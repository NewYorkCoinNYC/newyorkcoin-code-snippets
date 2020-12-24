# NewYorkCoin Code Snippets

A repository of example code for interacting with newyorkcoin services. 

Please send pull requests with code contributions!


## node.js examples
Accessing the newyorkcoind JSON-RPC interface with [node-newyorkcoin](https://github.com/NewYorkCoinNYC/Node-NewYorkCoin).

 - Fetch your wallet's balance with [getbalance.js](nodejs/getbalance.js);
 - Build a raw transaction with a private key that's not in your wallet with [buildrawtransaction.js](nodejs/buildrawtransaction.js);
 - Create a transaction when you are offline that is spent once it is manually sent to the p2p network with [offlinetransaction.js](nodejs/offlinetransaction.js).

## postgres examples
Leanr how to store newyorkcoin public addresses and transactions in a postgres database with [schema.sql](postgres/schema.sql).
