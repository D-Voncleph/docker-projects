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
    Open your web browser and go to `http://localhost:8081`.

5.  **Clean up:**
    ```bash
    docker stop fintech-container
    docker rm fintech-container
    ```

---

## Data Persistence: Volumes vs. Bind Mounts

Containers are ephemeral, meaning any data written inside a container is lost when the container is removed. To save (persist) data, we use volumes or bind mounts.

### 1. Named Volumes (Docker-Managed)

This is the recommended way to persist production data. Docker creates and manages a dedicated folder on the host's filesystem, and you just refer to it by its name.

* **Use Case:** Best for data that is generated *by the container*, such as a database, application logs, or user-uploaded content that you don't need to edit from the host.
* **Analogy:** A "safe deposit box" managed by Docker.

**Commands:**

* Create a volume:
    ```bash
    docker volume create my-data
    ```
* Mount the volume when running a container:
    ```bash
    docker run -v my-data:/path/in/container my-image
    ```
* List volumes:
    ```bash
    docker volume ls
    ```
* Remove a volume:
    ```bash
    docker volume rm my-data
    ```

### 2. Bind Mounts (User-Managed)

This method mounts a specific, existing directory or file from your host machine into the container. You manage the files on your host.

* **Use Case:** Best for **development**. You can mount your source code directory into the container. When you edit the code on your host, the changes are instantly reflected inside the container, allowing for live reloading.
* **Analogy:** "Your own desk drawer" that you give the container access to.

**Command:**

* Mount a directory from your host (using `$(pwd)` to get the current working directory's full path):
    ```bash
    docker run -v $(pwd)/my-app-code:/app my-image
    ```

---

## Basic Docker Command Reference

* **`docker run`**: Creates and starts a new container from an image.
* **`docker ps`**: Lists all *running* containers. (`-a` shows all).
* **`docker stop`**: Gracefully stops one or more running containers.
* **`docker rm`**: Removes one or more *stopped* containers.

---

## Connect with me

* **LinkedIn:** [linkedin.com/in/voncleph](https://www.linkedin.com/in/voncleph)
