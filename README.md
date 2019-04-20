# Hyperstack serverless (client-only)

## Examples

There are a number of ways of building and integrating client-side Hyperstack Components. Please see the examples below which increase in complexity.

### Example 1: Components built in the browser

The simplest approach is to build Components in your browser with no server needed at all.

See [example1](example1/)

### Example 2: Components built by a Rake task

A slightly better approach is to build Components in a Rake task outside of the browser.

See [example2](example2/)

## Building & Publishing hyperstack-client NPM

### Build

+ `rake build` will build `dist/hyperstack-client.js`, `dist/compiler.js` and `dist/opal.js`

### Publish to NPM

+ `yarn publish` and increment the version number
