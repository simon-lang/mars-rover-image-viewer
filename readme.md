# Mars Rover Image Viewer

## Requirements

Requires Node v6. [Installer available here](https://nodejs.org/en/).

## Installation

Install dependencies and build client by running `make`.

If make is not available on your machine, you can use `npm install && npm run build`.

## Running the HTTP Server

Start the HTTP server with `make server`

If make is not available on your machine, you can use `npm start`.

Visit in your browser: [http://localhost:3000](http://localhost:3000)

## Why the proxy?

The NASA API appears to disallow XHR CORS requests (i.e. from your browser). The `/proxy` route simply forwards requests to the NASA API.

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

- Directives + Templates
- Basic persistence
- Use ui-router
- Only show camera+rover combos that exist
