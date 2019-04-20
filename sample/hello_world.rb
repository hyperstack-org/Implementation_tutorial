class HelloWorld
  include Hyperstack::Component

  render do
    H1 { 'Hello World' }
  end
end

Document.ready? do
#   Element['#site'].render { HelloWorld() }
  React.render(ReactDOM.create_element(HelloWorld, nil), Element['#site'])
end
