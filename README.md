# Hyperstack Implementation Tutorial

WORK IN PROGRESS

Hyperstack lets you build  **client-centric, server-agnostic modern web-applications in Ruby**. Hyperstack provides an architecture which we believe contains all the concepts necessary to build an Isomorphic application, but the architecture is not opinionated and happily co-exist with other approaches.

The goal of this tutorial is to demonstrate some different ways of implementing Hyperstack alongside existing web frameworks and architectures.  

This tutorial focuses on the following three implementation scenarios:

+ [Section 1](/section_1/readme.md) Building a Hyperstack SPA with a new Rails application - this show off Hyperstack in all its glory, and we will cover all the key concepts

+ [Section 2](/section_2/readme.md) Adding Hyperstack to an existing multi-page Rails application. This section will demonstrate how to add Hyperstack bit by bit without a massive refactor

+ [Section 3](/section_3/readme.md) Building a complex Hybrid (or Universal) application consisting of web, desktop and mobile UIs

Before we start the tutorial, we should discuss some of the core Hyperstack architectural concepts:

## Hyperstack Architectural Concepts

The core Hyperstack architectural concepts are:

+ **Components** render the user interface and handle user actions which alter the application state. Using React, Components automatically re-render parts of the display as state changes due to local or remote activities.

+ **Stores** hold the local application state. Stores are Ruby classes that keep the dynamic parts of the state in special state variables. We use Stores to share state between Components.

+ **Router** provides client-side routing by wrapping ReactRouter. Client-side routing is fundamental for single-page applications as it allows the user to navigate using their browser history as if it were a multi-page application.

+ **Isomorphic Models** represent ActiveRecord models in your Isomorphic (client-side) code. Changes made to Model data is automatically synchronized between the client & server and any other client which might be displaying that data.  

+ **Isomorphic Operations** encapsulate business logic and act as a client-server API. In a traditional MVC architecture, Operations end up either in Controllers, Models or some other secondary construct such as service objects, helpers, or concerns. In Hyperstack they are first-class objects.

+ **Policies** keep authorization logic out of Models, and Operations, and also allows the isomorphic transport mechanism to know what and when to communicate between client and server.

## [Section 1](/section_1/readme.md) - Building a new Rails Single Page Application

This section will cover the following topics:

+ Creating a new Rail app with Hyperstack
+ Adding a SPA Router
+ Using JavaScript libraries
+ Working with Isomorphic models and Policies
+ Deploying to production

## [Section 2](/section_2/readme.md) - Adding Hyperstack to an existing Rails application

This section will cover the following topics:

+ Adding the Hyperstack Gem and configuration to an existing Rail application
+ Adding Components to Rails views
+ Transforming traditional Models into Isomorphic Models

## [Section 3](/section_3/readme.md) - Universal applications 

This section will cover the following topics:

+ Building a hybrid mobile/web application 

