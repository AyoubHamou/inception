
# Inception



## Introduction

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

## Containerization Technology Overview

Containerization is a lightweight, **OS-level** virtualization method used to deploy and run applications without launching an entire virtual machine (VM) for each app. Containers package an application and its dependencies, libraries, and configuration files together, ensuring the application runs consistently across different computing environments.
### History and evolution:

1- chroot : introduced in 1979. `Chroot` (change root) allowed the creation of a separate file system for a process, isolating it from the rest of the system. This was an early form of process isolation, but it had limitations in terms of security and resource management.

2- Control Groups (cgroups) : Google engineers started the work on `cgroups` in 2006, which was later merged into the Linux kernel. Cgroups allow **limiting**, accounting for, and isolating resource usage (CPU, memory, disk I/O, etc.) of a collection of processes.

3- Linux Namespaces (2002-2013) : `Namespaces` were gradually introduced in the Linux kernel between 2002 and 2013. They provide **isolation** for various system resources (process IDs, network interfaces, mount points, user IDs..), allowing processes to have their own isolated instance of global resources.

### Why we need containerization:

__Consistency__: Containers ensure that applications run consistently across different environments.

__Efficiency__: Containers share the host OS kernel, making them lighter and faster than VMs.

__Scalability__: Containers can be easily scaled up or down based on demand.

__Isolation__: Applications in containers are isolated from each other and the host system.

__Portability__: Containers can run on any system that supports the container runtime.

__DevOps and CI/CD__: Containers facilitate easier development, testing, and deployment processes.

### Key differences between containerization and virtualization:
![alt text](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*54YsjkI6yIAYq5dC41IGiQ.png)

__Abstraction level__:

`Virtualization`: Abstracts the physical hardware |
`Containerization`: Abstracts the OS kernel


__Resource utilization__:

`Virtualization`: Each VM runs a full OS, consuming more resources |
`Containerization`: Containers share the host OS kernel, using fewer resources


__Startup time__:

`Virtualization`: VMs take longer to start (minutes) |
`Containerization`: Containers start almost instantly (seconds)


__Isolation__:

`Virtualization`: Provides stronger isolation as each VM has its own OS |
`Containerization`: Lighter isolation, as containers share the host OS kernel


__Portability__:

`Virtualization`: VMs are less portable due to their size and full OS |
`Containerization`: Containers are highly portable and can run on any system with a compatible runtime


__OS support__:

`Virtualization`: Can run different OS on the same host |
`Containerization`: Typically limited to the same OS family as the host


__Performance__:

`Virtualization`: Slightly lower performance due to hardware `Virtualization` |
`Containerization`: Near-native performance as it runs directly on the host OS


__Use cases__:

`Virtualization`: Ideal for running multiple different OS or legacy applications |
`Containerization`: Best for microservices, application deployment, and scaling

## Docker: Simplifying Containers:

In 2013, *Docker* was introduced, revolutionizing the way developers worked with containers. *Docker* provided an easy-to-use platform that abstracted the complexities of namespaces and Cgroups. It allowed developers to package applications and their dependencies into a single, portable container image that could run anywhere. *Docker* made it simple to **create**, **deploy**, and **manage** containers, bringing containerization into the mainstream solving the classic **“it works on my machine”** problem.

![alt text](https://miro.medium.com/v2/resize:fit:2000/format:webp/1*Wr-rWYJKjzu-9M1X_3qBrA.png)

### The process from writing a Dockerfile to having a running Docker container:

**==>Step 1: Writing a Dockerfile.**
A Dockerfile is a text file that contains instructions for creating a Docker image, defining the environment, base image, dependencies, files to copy, and commands to run. This provides a reproducible and automated way to build Docker images. Think of it as a blueprint for creating a Docker image, or like a Makefile if you want to think of it like that.

**==>Step 2: Building the Docker Image.**
After writing the Dockerfile, the next step is to build the Docker image using the `docker build` command. During this process, Docker reads the instructions in the Dockerfile and executes them in order: Pull the Base Image, Execute Instructions, Create Layers, and Finalize Image.

**==>Step 3: Running the Docker Container.**
After building the Docker image, you can run a container using the `docker run` command. This involves creating a new container, isolating its resources, managing resource allocation, and starting the container to run the specified command from the Dockerfile.

**==>Step 4: Managing the Docker Container.**
Once the container is running, Docker provides commands to manage it:

Use `docker ps` to monitor running containers
Employ `docker stop` and `docker start` to control the container’s lifecycle.
Remove a container with `docker rm`
Retrieve logs using `docker logs` for debugging and monitoring.
