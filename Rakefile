# require 'hyperstack-config'
require 'rubygems'
# require 'opal-rails'
# require 'hyper-operation'
# require 'hyper-store'
require 'hyper-state'
require 'hyper-router'
require 'opal-browser'
require 'opal-jquery'
require 'uglifier'


desc 'Build hyperstack-js'
task :build do

  mkdir 'dist' unless File.directory?('dist')
  Opal.append_path 'hyperstack'

  puts "About to build hyperstack-client.js"
  File.binwrite './dist/hyperstack-client.js', Opal::Builder.build('hyperstack.rb').to_s
  puts "done"

  puts "About to build opal.js"
  File.binwrite './dist/opal.js', Opal::Builder.build('opal').to_s
  puts "done"
end

desc 'Minify using uglifier gem'
task :minify do

  mkdir 'dist' unless File.directory?('dist')

  puts "About to build hyperstack.min.js"
  js_file = "hyperstack.js"
  js_min_file = "./dist/hyperstack.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"

  puts "About to build opal.min.js"
  js_file = "opal.js"
  js_min_file = "./dist/opal.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"
end
task default: [:build, :minify]
