class HyperComponent
  include Hyperstack::Component
end

class TopLevelComponent < HyperComponent
  render(DIV) do
    HelloWorld()
  end
end

class HelloWorld < HyperComponent
  render(DIV) do
    H2 { 'Hello World from precompiled component' }
    BUTTON { 'Click me' }.on(:click) { alert 'hello' }
  end
end

Document.ready? do
  include Hyperstack::Component # for ReactAPI
  mount_point = Element['#top_level_component']
  ReactAPI.render(ReactAPI.create_element(TopLevelComponent, {}), mount_point)
end
