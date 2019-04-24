# Hyperstack Implementation Options

WORK IN PROGRESS

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

## Server or Serverless Implementation

There are two fundamental ways of using Hyperstack:

+ **Server** - integrated with a web server. In this model the web server compiles Ruby to JavaScript. There is tight coupling of the services of the web server and the client (Isomorphic Models and Operations).
+ **Serverless** - as a client-only library. In this model there needs to be an external build process to compile your code from Ruby to JavaScript. Hyperstack is imported from a CDN or as a Webpack module.

The table below illustrates which of the Architectural concepts are available depending on the implementation:

|   	      |Components|Stores|Router|Isomorphic Models|Isomorphic Operations|Policies|
|---	      |---	     |---	  |---	 |---           	  |---           	     |---     |
|Server     |√         |√  	  |√  	 |√             	  |√             	     |√       |
|Serverless |√         |√  	  |√  	 |no            	  |no             	   |no      |

## Server Implementation

Hyperstack is only integrated with Rails at the moment, but we plan to add additional frameworks in the future.

+ [Hyperstack and Rails](/Server/Rails)

## Serverless Implementation

+ [Serverless Hyperstack](/Serverless)
