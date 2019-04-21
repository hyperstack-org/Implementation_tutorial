## Serverless Implementation Options

In a serverless implementation, Hyperstack is either imported as a JS library from a CDN or required by as a module by Webpack.

### Using Webpack

```
yarn add hyperstack-client
# or
npm install hyperstack-client --save
```

### Importing Hyperstack JavaScript from a CDN

```html
<head>
  <!-- React and JQuery (or bring your own) -->
  <script src="https://unpkg.com/react@15/dist/react.min.js"></script>
  <script src="https://unpkg.com/react-dom@15/dist/react-dom.min.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

  <!-- React Router (if you are using it) -->
  <script src="https://unpkg.com/react-router/umd/react-router.min.js"></script>

  <!-- Opal (or bring your own) -->
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/dist/opal.min.js"></script>

  <!-- Hyperloop-js -->
  <script src="https://rawgit.com/ruby-hyperloop/hyperloop-js/master/dist/hyperloop.min.js"></script>
</head>
```

Additionally, there needs to be a method of compiling your Ruby code into JavaScript.

EXAMPLES
