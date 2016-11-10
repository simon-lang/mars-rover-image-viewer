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

Your NASA API key is set server side through an environment variable called NASA_API_KEY. So, to set it for a single run, you can do `NASA_API_KEY=xyz make server`. [This page](https://12factor.net/config) explains why storing config in environment variables is a good thing.

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
- HTML5 Date Input
- Dupes in repeater
- Error handling for bad API calls
- Only show camera+rover combos that exist
- Add routing (so clicking browser back/forward will navigate between tabs)
- Server Side Persistence
- Tidy the UI display and bring it more in line with the mockups
- Limit search results to 20 at a time
- Add unit tests
