-- Some useful schema for storing newyorkcoin datatypes in postgres.

-- Setting a column to be nyc_public_address type ensures that only
-- valid newyorkcoin addresses can be stored in that column.
CREATE DOMAIN nyc_public_address AS varchar(40) CHECK (VALUE ~ 'D[1-9A-HJ-NP-Za-km-z]{20,40}');

-- All newyorkcoin transaction txids are 64 characters long.
CREATE DOMAIN nyc_transaction AS varchar(64);


-- Example of table to store accounts indexed by their public address.
CREATE TABLE account (
    public_address nyc_public_address PRIMARY KEY,
    created timestamp NOT NULL DEFAULT now());

-- Example of a table that stores transactions. Note that a transaction
-- is uniquely identified by it's (txid, vout) pair.
CREATE TABLE transaction (
    public_address nyc_public_address NOT NULL REFERENCES account(public_address),
    txid nyc_transaction NOT NULL,
    vout bigint NOT NULL,
    created timestamp NOT NULL DEFAULT now(),
    confirmations integer NOT NULL,
    amount decimal NOT NULL,
    PRIMARY KEY (public_address, txid, vout));
CREATE UNIQUE INDEX transaction_txid_vout_idx ON transaction(txid, vout);
