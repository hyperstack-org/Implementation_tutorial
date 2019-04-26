# Hyperstack Implementation Options

Hyperstack is designed for building  **client-centric, server-agnostic modern web-applications in Ruby**. Hyperstack provides an architecture which we believe contains all the concepts  necessary to build an Isomorphic application, but the architecture is not opinionated and will happily co-exist with other approaches.

The goal of this repo is to demonstrate a number of different ways of implementing Hyperstack alongside existing web frameworks and architectures.  

## Hyperstack Architectural Concepts

The core Hyperstack architectural concepts are:

+ **Components** describe how the UI will display the current application state and how it will handle user actions. Using React, Components automatically re-render parts of the display as state changes due to local or remote activities.

+ **Stores** hold the local application state. Stores are Ruby classes that keep the dynamic parts of the state in special state variables. We use Stores to share state between Components.

+ **Router** provides client-side routing by wrapping ReactRouter. Client-side routing is fundamental for single page applications as it allows the user to navigate using their browser history as if it were a multi-page application.

+ **Isomorphic Models** represent ActiveRecord models in your Isomorphic (client-side) code. Changes made to Model data is automatically synchronized between the client & server and any other client which might be displaying that data.  

+ **Isomorphic Operations** encapsulate business logic and act as a client-server API. In a traditional MVC architecture, Operations end up either in Controllers, Models or some other secondary construct such as service objects, helpers, or concerns. In Hyperstack they are first class objects.

+ **Policies** keep authorization logic out of Models, and Operations, and also allows the isomorphic transport mechanism to know what and when to communicate between client and server.

## Web server, Serverless, and Universal Implementation

There are two fundamental ways of using Hyperstack:

+ **Web Server** - integrated with a web server. In this model the web server compiles Ruby to JavaScript. There is tight coupling of the services of the web server and the client (Isomorphic Models and Operations).
+ **Serverless** - as a client-only library. In this model there needs to be an external build process to compile your code from Ruby to JavaScript. Hyperstack is imported from a CDN or as a Webpack module.
+ **Universal** - we believe a modern web application needs to run in the browser, as a desktop application and as a mobile app for IOS and Android. This project is still in inception, but our goal is to integrate with the Cordova build process to allow you build a Cordova project in Ruby.

The table below illustrates which of the Architectural concepts are available depending on the implementation:

|   	      |Components|Stores|Router|Isomorphic Models|Isomorphic Operations|Policies|
|---	      |---	     |---	  |---	 |---           	  |---           	     |---     |
|Web Server |√         |√  	  |√  	 |√             	  |√             	     |√       |
|Serverless |√         |√  	  |√  	 |no            	  |no             	   |no      |
|Universal  |√         |√  	  |√  	 |√             	  |√              	   |√       |

## Server Implementation (Rails)

Hyperstack is only integrated with Rails at the moment, but we plan to add additional frameworks in the future. To date, all server integrated has been focused on Rails and Hyperstack is highly integrated with Rails with the following functionality out the box:

+ Works with Rails 4.x and 5.x
+ All Hyperstack COMPS architectural concepts (explained above)
+ A build and deploy system with HotLoading code
+ Fully integrated with Webpacker and Webpack
+ Isomorphic Models (sharing the same Model between in your client and server code)
+ Data synchronization (changes made either on the server or client are pushed to all clients currently displaying that data)
+ A Policy system for regulating data access and data broadcast
+ Isomorphic Operations (Operations are classes that encapsulate business logic which can execute on the client or server - they mitigate the need for an internal API)
+ HyperSpec for Isomorphic RSpec testing across the client and server
+ Il8n functionality for multi language sites

+ Please see [Hyperstack Rails](/Server/Rails) for more information and examples

## Serverless Implementation

In a non-Rails environment, the client-side architectural components of Hyperstack can still be used to build interactive websites in Ruby.

The main consideration is the build process and there are several supported:

+ Compiling Ruby code in your browser (suitable for testing and very small sites)
+ Compiling Ruby code via Rake tasks (cumbersome but a simple solution that works)
+ Using Rack + Webpack for a build and deploy system equal to react.js + Webpack
+ Going completely native and using react.js + Webpack to build and compile Hyperstack

+ Please see [Hyperstack Serverless](/Serverless) for more information and examples

## Universal Application

This project is still in inception and testing phase. If you are interested or have experience here please reach out to us on Slack. As this project evolves we will add examples here.
