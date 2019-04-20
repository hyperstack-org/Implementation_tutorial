class HelloWorld
  include Hyperstack::Component
  param :a

  render do
    H1 { 'Hello World from precompiled component' }
  end
end

Document.ready? do
  include Hyperstack::Component
  Element['#site'].render { HelloWorld() }
  # ReactAPI.render(ReactAPI.create_element(HelloWorld, {a: '1'}), Element['#site'])
end
