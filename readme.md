# Mars Rover Image Viewer

[https://captainclam.github.io/mars-rover-image-viewer/](https://captainclam.github.io/mars-rover-image-viewer/)

## Requirements

Requires Node to develop. [Installer available here](https://nodejs.org/en/).

## Development

Install dependencies and build client by running `make build`.

If make is not available on your machine, you can use `npm install && npm run build`.

The client can be edited with live reload using the webpack-dev-server by running `make dev` or `npm run dev` and visiting [http://localhost:8080/webpack-dev-server/](http://localhost:8080/webpack-dev-server/) in your browser.

## Running the Tests

Run tests with `make test` or `npm test`.

## Linting

Use `make lint` to lint the Coffeescript source.

## Technology Used

- Coffeescript and Node for all scripting
- LESS for CSS pre-processing
- Pug for HTML templating (previously called Jade)
- NPM for dependency management
- Webpack for building/bundling
- Bootstrap as a CSS Framework
- Angular JS for a JS Framework. lodash and moment for utility
- Mocha, Chai, Sinon for testing, assertions and spies
- Coffeelint for linting
- Make for providing a simple API for installing, testing, running
- Express.js was used for the now-defunct http proxy

## TODO

- Using sol dates from the manifest could grey out days on the calendar that do not have photos
- Send page param to NASA API. Add pagination controls
- Better error handling for bad API calls
- Add routing (so clicking browser back/forward will navigate between tabs)
- Server Side Persistence
- Smooth Image loading angular directive
- Add unit tests that actually showcase proper ui testing

## Known Issues

- Date filter is one day off date on photos received.


## Disclaimer

My motivation in approaching this demo is to showcase a range of typical technologies I use and approach to structuring a webapp.

For such a small app, this probably seems like an excess of technology. It could easily be achieved more elegantly with simple HTML+CSS+JS with no pre-processors, frameworks, unit tests, etc. However for real world projects, these things do make life easier. So I've aimed to showcase my typical approach to a single page app.

This also doesn't mean I think these are the *best* technologies to use. In the future I'd probably use React+Redux over Angular, and ES6 over Coffeescript. Usually I use grunt, jade and html2js. In this app I have used webpack, pug and pug-html-loader.

Similarly, while this doesn't have a huge amount of polish, or perfectly functional, I've tried to strike a reasonable amount of polish and functionality in the time I allowed for this development.

You'll notice code commenting has been kept to a minimum. I try to write code that is readable and self-explanatory to anyone familiar with the technology, and only comment when I am doing something that isn't immediately obvious - like with the `hasCamera` method in `main.coffee`.

