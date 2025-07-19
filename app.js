const http = require('http');

// Define the port to listen on. Cloud Run injects the PORT environment variable.
const port = process.env.PORT || 8080;

// Create a simple HTTP server
const server = http.createServer((req, res) => {
  // Set the response HTTP header with HTTP status and Content-Type
  res.writeHead(200, {'Content-Type': 'text/plain'});

  // Send the response body "Hello GCP World"
  res.end('Hello GCP World\n');
});

// Start the server and listen on the specified port
server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});