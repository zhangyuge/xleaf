# xleaf

This simple app demonstrates the use of [Leaf](https://github.com/eycorsican/leaf) on macOS.

**NOTE This app uses the `NetworkExtension` framework.**

Leaf supports a large feature set including SOCKS 5, HTTP, Shadowsocks, VMess and Trojan proxy protocols, and plugable proxy transports such as WebSocket and TLS. There are also flexible load balancing / high availability features to better deliver your network requests.

The app has no UIs and the switch is the only button to start and stop the proxy, you can control all the proxy behaviors by changing a config file, which is defined as a `String` variable and located in `PacketTunnel/PacketTunnelProvider.swift`.

### Build & Run

1. Fix `Bundle Identifier` and `App Groups` identifier and entitlements.

2. Build Leaf

See https://github.com/eycorsican/leaf#build

```sh
make lib
cp target/release/libleaf.a /path/to/xleaf/PacketTunnel/libleaf
cp target/release/leaf.h /path/to/xleaf/PacketTunnel/libleaf
```

3. Download dat files:

```sh
./misc/download_data.sh
```

4. Edit the config `conf` in `PacketTunnel/PacketTunnelProvider.swift`, examples can be found [here](https://github.com/eycorsican/leaf/blob/master/README.zh.md#conf)

5. Build and Run

### View Logs

Leaf by default outputs logs to the console, since it's a static library used by the NetworkExtension executable, you can checkout the logs on macOS via the `Console.app`.
