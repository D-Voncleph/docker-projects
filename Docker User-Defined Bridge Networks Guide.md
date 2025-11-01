# How to Use Docker's User-Defined Bridge Networks for Service Discovery

## 1. The Goal

The default `bridge` network in Docker does not provide automatic DNS resolution between containers. This means containers cannot find each other using their container names.

By creating a user-defined bridge network, we enable Docker's built-in DNS service. This allows containers on the same network to discover and communicate with each other simply by using their service names, which is the foundation of a modern microservice architecture.

This document outlines the process to create a custom network and prove that this service discovery works.

## 2. The Process

### Step 1: Create the Custom Network

First, create a new user-defined bridge network. We will call ours `my-app-net`.

```bash
docker network create my-app-net
```

You can verify its creation by listing all available networks:

```bash
docker network ls
```

### Step 2: Launch a "Server" Container

Next, we launch a service container. We will use `postgres` as our example. We must attach it to our new network and give it a name (`my-postgres`) that other containers can use to find it.

```bash
docker run -d \
  --name my-postgres \
  --network my-app-net \
  -e POSTGRES_PASSWORD=mysecretpassword \
  postgres
```

**Options explained:**
- `-d`: Runs the container in detached (background) mode.
- `--name my-postgres`: This is the hostname our client will ping.
- `--network my-app-net`: Attaches the container to our custom network.

### Step 3: Launch a "Client" Container

Now, we launch a second container (our "client") on the same network. We will use a basic `ubuntu` image and open an interactive shell inside it.

```bash
docker run -it --rm \
  --name my-ubuntu \
  --network my-app-net \
  ubuntu \
  bash
```

**Options explained:**
- `-it`: Gives us an interactive terminal.
- `--rm`: Automatically removes this container when we `exit` (good for cleanup).
- `--network my-app-net`: Attaches this client to the same network as the server.

Your terminal prompt will now be a shell inside the `my-ubuntu` container.

### Step 4: Install Tools (Inside the Client)

The base `ubuntu` image is minimal. We need to install the `ping` utility.

Run these commands inside the Ubuntu container's shell:

```bash
# First, update the package manager's list
apt-get update

# Next, install the ping utility
apt-get install -y iputils-ping
```

### Step 5: Prove the Connection

This is the final test. From inside the `my-ubuntu` container, ping the `postgres` container using only its container name.

```bash
ping my-postgres
```

You will see a successful reply, similar to this:

```
PING my-postgres (172.20.0.2) 56(84) bytes of data.
64 bytes from my-postgres.my-app-net (172.20.0.2): icmp_seq=1 ttl=64 time=0.158 ms
64 bytes from my-postgres.my-app-net (172.20.0.2): icmp_seq=2 ttl=64 time=0.101 ms
...
--- my-postgres ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 0.101/0.129/0.158/0.028 ms
```

## 3. Conclusion

This test proves that the `my-ubuntu` container successfully resolved the hostname `my-postgres` to its internal IP address (e.g., `172.20.0.2`) without any manual configuration. This automatic DNS resolution is the key feature of user-defined bridge networks.

---
