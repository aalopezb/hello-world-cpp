# Use a base image with C++ support
FROM mcr.microsoft.com/cpp/build:latest

# Set the working directory
WORKDIR /app

# Copy the source file to the container
COPY main.cpp .

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    g++ \
    libcpprest-dev \
    && rm -rf /var/lib/apt/lists/*

# Compile the program
RUN g++ main.cpp -o app -lcpprest

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["./app"]
