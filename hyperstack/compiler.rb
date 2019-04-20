require 'opal/compiler'

Document.ready? do
  promises = []
  code = []
  Element['script[type="text/ruby"]'].each_with_index do |script_tag, index|
    src = script_tag.attr('src')
    if src
      promises << HTTP.get(src).then do |response|
        code[index] = response.body
      end
    else
      code[index] = script_tag.html
    end
  end
  Promise.when(*promises).then do
    compiled_code = nil
    continue_to_mounting = nil
    begin
      compiled_code = Opal::Compiler.new(code.join("\n")).compile
    rescue Exception => e
      `console.error("Error raused when compiling #{e.message}")`
    end
    begin
      `eval(compiled_code)`
      continue_to_mounting = true
    rescue Exception => e
      `console.error("Error raused when compiling #{e.message}")`
    end if compiled_code
    Element['[data-hyperstack-mount]'].each do |mount_point|
      puts "found mount point"
      component_name = mount_point.attr('data-hyperstack-mount')
      component = nil
      begin
        puts "found #{component_name}"
        component = Object.const_get(component_name)
      rescue
        `console.error("Could not find Component class named #{component_name}")`
        next
      end
      params = Hash[*Hash.new(mount_point.data).collect do |name, value|
        [name.underscore, value] unless name == 'reactrbMount'
      end.compact.flatten(1)]
      puts "about to render"
      ReactAPI.render(ReactAPI.create_element(component, params), mount_point)
    end if continue_to_mounting
  end
end
#
