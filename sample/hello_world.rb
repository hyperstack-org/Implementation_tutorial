class HelloWorld
  include Hyperstack::Component

  render(DIV) do
    H1 { 'Hello World from precompiled component' }
    BUTTON { 'Click me' }.on(:click) { alert 'hello' }
  end
end

Document.ready? do
  include Hyperstack::Component # for ReactAPI
  mount_point = Element['#site']
  ReactAPI.render(ReactAPI.create_element(HelloWorld, {}), mount_point)
  # mount_point.render
end
