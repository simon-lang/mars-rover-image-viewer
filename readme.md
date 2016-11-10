# Mars Rover Image Viewer

## Requirements

Requires Node v6. [Installer available here](https://nodejs.org/en/).

## Installation

Install dependencies and build client by running `make`.

If make is not available on your machine, you can use `npm install && npm run build`.

## Running the HTTP Server

Start the HTTP server with `make server`

If make is not available on your machine, you can use `npm start`.

## Why the proxy?

The NASA API appears to disallow XHR CORS requests (i.e. from your browser). The proxy simply forwards and requests to `/proxy` to the NASA API.

## Technology Used

- Coffeescript and Node for all scripting
- LESS for CSS pre-processing
- Pug for HTML templating (previously called Jade)
- NPM for dependency management
- Webpack for building/bundling
- Bootstrap as a CSS Framework
- Angular JS for a JS Framework
- Express for the HTTP Server and node-fetch for accessing the NASA API

## TODO

- Filters
- Directives + Templates
- "Save" functionality
- Load NASA API key via env var
