# Docker Projects

This repository contains a collection of projects and notes as I learn and practice Docker for containerization.

---

## Project 1: FinTech App (v1)

This project contains a simple `Dockerfile` to containerize a static frontend for a FinTech application. It uses a lightweight `nginx:alpine` image and serves a single `index.html` file.

### How to Use

1.  **Navigate to the project directory:**
    ```bash
    cd fintech-app
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t fintech-app:v1 .
    ```

3.  **Run the container:**
    This command runs the container in detached mode, maps your local port 8081 to the container's port 80, and gives it a friendly name.
    ```bash
    docker run --detach --publish 8081:80 --name fintech-container fintech-app:v1
    ```

4.  **Access the application:**
    Open your web browser and go to `http://localhost:8081`. You should see "Welcome to FinTechApp v1".

5.  **Clean up:**
    When you are finished, stop and remove the container.
    ```bash
    docker stop fintech-container
    docker rm fintech-container
    ```

---

## Basic Docker Command Reference

This section serves as a quick reference for the foundational Docker commands.

### `docker run`

**Purpose:** Creates and starts a new container from a specified image.

**Common Flags:**
* `--detach` or `-d`: Runs the container in the background.
* `--publish <host_port>:<container_port>`: Maps a port on the host to a port inside the container.

### `docker ps`

**Purpose:** Lists all *running* containers.
* `-a` or `--all`: Shows all containers, including stopped ones.

### `docker stop`

**Purpose:** Gracefully stops one or more running containers.
* **Usage:** `docker stop <container_id_or_name>`

### `docker rm`

**Purpose:** Removes one or more *stopped* containers.
* **Usage:** `docker rm <container_id_or_name>`

---

## Connect with me

* **LinkedIn:** [linkedin.com/in/voncleph](https://www.linkedin.com/in/voncleph)