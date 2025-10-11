# Docker Projects

This repository contains a collection of projects and notes as I learn and practice Docker for containerization.

## Project 1: FinTechApp Frontend

The first project is a simple placeholder `index.html` file for a future FinTech application.

---

## Basic Docker Command Reference

This section serves as a quick reference for the foundational Docker commands used to manage the container lifecycle.

### `docker run`

**Purpose:** Creates and starts a new container from a specified image. If the image is not found locally, Docker will attempt to download it from a public registry (like Docker Hub).

**Common Flags:**
* `--detach` or `-d`: Runs the container in the background so it doesn't lock up the terminal.
* `--publish <host_port>:<container_port>` or `-p <host_port>:<container_port>`: Maps a port on the host machine to a port inside the container, allowing you to access the container's service from your local network.

**Examples:**

* Run a simple container that prints a message and exits:
    ```bash
    docker run hello-world
    ```
* Run a persistent Nginx web server in the background and map port 8080 on the host to port 80 in the container:
    ```bash
    docker run --detach --publish 8080:80 nginx
    ```

### `docker ps`

**Purpose:** Lists all *running* containers. This is the primary command to check the status of your active containers.

**Common Flags:**
* `-a` or `--all`: Shows all containers, including those that have been stopped or have exited.

**Examples:**

* List all currently running containers:
    ```bash
    docker ps
    ```
* List all containers, both running and stopped:
    ```bash
    docker ps -a
    ```

### `docker stop`

**Purpose:** Gracefully stops one or more running containers. It sends a SIGTERM signal to the main process inside the container, allowing it to shut down cleanly.

**Usage:**

* You need to provide the `CONTAINER ID` or the `NAME` of the container you wish to stop. You can get this information from the `docker ps` command. You only need the first few unique characters of the ID.

**Example:**

* Stop a container with the ID `1a2b3c4d`:
    ```bash
    docker stop 1a2b3c4d
    ```

### `docker rm`

**Purpose:** Removes one or more *stopped* containers. This is used to clean up containers you no longer need, which frees up disk space. You cannot remove a container while it is still running; you must stop it first.

**Usage:**

* Provide the `CONTAINER ID` or `NAME` of a stopped container.

**Example:**

* Remove a stopped container with the ID `1a2b3c4d`:
    ```bash
    docker rm 1a2b3c4d
    ```
---

## Connect with me

* **LinkedIn:** [linkedin.com/in/voncleph](https://www.linkedin.com/in/voncleph)
