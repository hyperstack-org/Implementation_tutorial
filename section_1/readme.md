# Section 1 - Building a new Rails Single Page Application

This section will cover the following topics:

+ [Creating a new Rail app with Hyperstack](#creating-a-new-rail-app-with-hyperstack)
+ [Adding a SPA Router](#adding-a-spa-router)
+ Using JavaScript libraries
+ Working with Isomorphic models and Policies
+ Deploying to production

## Creating a new Rail app with Hyperstack

Creating a new Rails application with Hyperstack all installed is very simple:

Create a new rails application:

```bash
rails new MyApp
```

Add the Hyperstack gem:

```bash
cd MyApp

bundle add 'rails-hyperstack' --version "~> 1.0.alpha1.0"
```

Run the installer (which will create all the Hyperstack folders and config)

```bash
bundle exec rails hyperstack:install
```

And that's it, Hyperstack is installed.

Run the server and navigate load the webpage in your browser:

```bash
foreman start
```

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

## Adding a SPA Router

Unlike traditional multi-page-applications, single-page-applications (SPA) are exactly that - a single page with all the content loaded as required. In a SPA, Rails has a very small part to play in routing - the Rails server simply receives the URL and loads the SPA, passing the URL down into the SPA for the client-side router to decide which code to run.

### Server side routing

After you have installed Hyperstack, if you look in `routes.rb` you will find this code:

```ruby
get '/(*others)', to: 'hyperstack#app'
```

The code above (at the end of routes.rb) simply routes everything that has not already been routed to the `hyperstack_controller` and runs the `app` method. The `hyperstack_controller` is added dynamically by Hyperstack, and actually you can route to any Controller and method you choose. 

### Client side routing

Lets change the default App component to add a basic router:

```ruby
class App < HyperComponent
  include Hyperstack::Router

  render(DIV) do
    Switch do
      Route("/", exact: true, mounts: Home)
      Route("/docs", exact: true, mounts: Docs)
    end
  end
end

class Home < HyperComponent
  render(DIV) do
    H1 { "Home" }
  end
end

class Docs < HyperComponent
  render(DIV) do
    H1 { "Docs" }
  end
end
```

Navigate to `localhost:5000/` and the `Home` Component will be rendered and navigate to `localhost:5000/docs` and the `Docs` Component will be rendered.

Now we know the SPA will route to the correct Component when the page first loads. Time for us to add a menu system for some client-side routing (which will not call the server):

```ruby
class App < HyperComponent
  include Hyperstack::Router

  render(DIV) do
    Menu()
    Switch do
      Route("/", exact: true, mounts: Home)
      Route("/docs", exact: true, mounts: Docs)
    end
  end
end

class Menu < HyperComponent
  include Hyperstack::Router::Helpers

  render(DIV) do
    Link("/") { "Home" }
    SPAN { " | " }
    Link("/docs") { "Docs" }
  end
end

class Home < HyperComponent
  render(DIV) do
    H1 { "Home" }
  end
end

class Docs < HyperComponent
  render(DIV) do
    H1 { "Docs" }
  end
end
```

In the code above, we have added a `Menu` Component with a very basic menu. Using the `Link` helper method from the `include Hyperstack::Router::Helpers` mixin.
