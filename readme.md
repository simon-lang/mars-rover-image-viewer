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

## Running the Tests

Run tests with `make test` or `npm test`.

## Linting

Use `make lint` to lint the Coffeescript source.

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
- Mocha, Chai, Sinon for testing, assertions and spies
- Coffeelint for linting
- Make for providing a simple API for installing, testing, running

## TODO

- Directives + Templates
- Send page param to NASA API. Add pagination controls
- Use Mission Manifest API to determine acceptable dates
- Datepicker
- Better error handling for bad API calls
- Add routing (so clicking browser back/forward will navigate between tabs)
- Server Side Persistence
- Further bring the UI display more in line with the mockups
- Smooth Image loading directive
- Add unit tests that actually showcase proper ui testing

## Known Issues

- Possibly a development issue only, however on a few occasions I have managed to get duplicate items in the collected items which results in an angular ngDupes error being thrown. `localStorage.clear()` in console to resolve. Can not reliably reproduce now.

## Disclaimer

My motivation in approaching this demo is to showcase a range of typical technologies I use and approach to structuring a webapp.

For such a small app, this probably seems like an excess of technology. It could easily be achieved more elegantly with simple HTML+CSS+JS with no pre-processors, frameworks, unit tests, etc. However for real world projects, these things do make life easier. So I've aimed to showcase my typical approach to a single page app.

This also doesn't mean I think these are the *best* technologies to use. In the future I'd probably use React+Redux over Angular, and ES6 over Coffeescript. Usually I use grunt, jade and html2js. In this app I have used webpack, pug and pug-html-loader.

Similarly, while this doesn't have a huge amount of polish, or perfectly functional, I've tried to strike a reasonable amount of polish and functionality in the time I allowed for this development.

You'll notice code commenting has been kept to a minimum. I try to write code that is readable and self-explanatory to anyone familiar with the technology, and only comment when I am doing something that isn't immediately obvious - like with the `hasCamera` method in `main.coffee`.

