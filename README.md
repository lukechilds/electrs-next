# electrs-next

> Docker configuration for testing the `next` branch of electrs.

Builds `romanz/bitcoin:locations` and `romanz/electrs:next` from source, starts a mainnet Bitcoin Core node and then runs the electrs indexer.

Add relevant CLI flags in `docker-compose.yml` if you want to run testnet/regtest.

The data dirs default to `./data/bitcoin` and `./data/electrs` relative to `docker-compose.yml` on the host. You can point these elsewhere by changing them in `docker-compose.yml` if you already have a copy of the blockchain.

To run:

```shell
git clone https://github.com/lukechilds/electrs-next.git
cd electrs-next
docker-compose up
```
