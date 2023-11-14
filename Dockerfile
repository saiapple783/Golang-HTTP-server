# Use the official Golang image as the base image
FROM golang:alpine

# Set the working directory for the application
WORKDIR /app

# Copy go mod and sum files 
COPY go.mod ./

# Download dependancies 
RUN go mod download 

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080 for the web server
EXPOSE 8080 

# Set the command to run the executable when the container starts
CMD ["/app/main"]