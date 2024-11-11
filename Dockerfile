# Use a base image
FROM ubuntu:20.04

# Set the working directory
WORKDIR /app

# Install the necessary packages
RUN apt-get update && apt-get install -y \
    g++ \
    libcpprest-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy your application's files
COPY main.cpp .

# Compile the application
RUN g++ main.cpp -o app -lcpprest -lssl -lcrypto -lpthread

EXPOSE 8080

# Keep the container running
CMD ["./app"]
