/* A "Hello World" example of using node-newyorkcoin to access
 * newyorkcoind via JSON-RPC. Retreives the current wallet balance.
 *
 * Either run newyorkcoind directly or run newyorkcoin-qt with the -server
 * command line option. Make sure you have a ~/.newyorkc/newyorkcoin.conf
 * with rpcuser and rpcpassword config values filled out. Note that
 * newer versions of newyorkcoin (1.5 and above) don't allow identical
 * your rpc username and password to be identical.
 *
 */

/* Copy config.json.template to config.json and fill in your
 * rpc username and password. */
var config = require('config');

var newyorkcoin = require('node-newyorkcoin')({
      host: config.rpchost,
      port: config.rpcport,
      user: config.rpcuser,
      pass: config.rpcpassword
    });

newyorkcoin.getBalance(function(err, balance) {
  if (err) {
    return console.error('Failed to fetch balance', err.message);
  }
  console.log('NYC balance is', balance);
});
