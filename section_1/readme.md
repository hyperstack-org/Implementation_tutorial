# Section 1 - Building a new Rails Single Page Application

This section will cover the following topics:

+ Creating a new Rail app with Hyperstack
+ Adding a SPA Router
+ Using JavaScript libraries
+ Working with Isomorphic models and Policies
+ Deploying to production

## Creating a new Rail app with Hyperstack

Creating a new Rails application with Hyprstack all installed is very simple:

+ Create a new rails application

`rails new MyApp`

+ Add the Hyperstack gem

`cd MyApp`
`bundle add 'rails-hyperstack' --version "~> 1.0.alpha1.0"`

+ Run the installer (which will create all the Hyperstack folders and config)