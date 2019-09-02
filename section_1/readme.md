# Section 1 - Building a new Rails Single Page Application

This section will cover the following topics:

+ Creating a new Rail app with Hyperstack
+ Adding a SPA Router
+ Using JavaScript libraries
+ Working with Isomorphic models and Policies
+ Deploying to production

## Creating a new Rail app with Hyperstack

Creating a new Rails application with Hyprstack all installed is very simple:

Create a new rails application

`rails new MyApp`

Add the Hyperstack gem

`cd MyApp`
`bundle add 'rails-hyperstack' --version "~> 1.0.alpha1.0"`

Run the installer (which will create all the Hyperstack folders and config)

`bundle exec rails hyperstack:install`

And that's it! Hyperstack is installed.

Run the server and navigate load the webpage in your browser:

`foreman start`

Navigate to: 

`http://localhost:5000/`

You should see a page with the word `App` - hooray you are installed!

### A few notes on Hyperstack configuration:

+ `app\hyperstack` is where all the Hyperstack code lives. This folder basically replaces your Rails MVC folders. The `component` sub-folder contains your Hyperstack components and the `models` sub-folder your Isomorphic models (you can still keep server-only models in your normal models folder).
+ `app\javascript` is a Webpacker folder containing js files known as packs. These are mich like gem files for the front end, they are the JS packages Webpack will compile and deliver to the front-end. Wer will cover these in more detail later in this tutorial.
+ `app\policies` contain your policy files which grant or deny access to models depending on who the current user is. We will cover policies later in this tutorial. For now, just note that a default (development only) completely open policy has been added. 
+ `initializers\hyperstack.rb` contains all the Hyperstack optional  initialization.  
+ `Procfile` is a configuration file used by the Foreman gem to start the rails server and also run a Hotloader process. When you type `foreman start` this file is used.
+ `package.json` is used by Webpacker and Yarn (basically like a gemfile) to specify which JS libraries will be required.

