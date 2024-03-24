# penultimate debian version (https://www.debian.org/releases/)
FROM debian:bullseye

# update
RUN apt update -y
# installing wget and installing cadvisor
RUN apt install wget -y && wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && chmod +x cadvisor

# starting the container with cadvisor
CMD ["./cadvisor"]
