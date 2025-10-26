# 1. Start from the official Ubuntu base image
FROM ubuntu:latest

# 2. Update the package list
RUN apt-get update

# 3. Set the default command to keep the container running
CMD ["sleep", "3600"]