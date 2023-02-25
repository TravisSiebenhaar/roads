require 'erubis'
require 'roads/file_model'

module Roads
  class Controller
    include Roads::Model

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new(env)
    end

    def params
      request.params
    end

    def render(view_name, locals={})
      filename = File.join('app', 'views', controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      STDOUT.puts "eruby result: #{eruby.inspect}"
      eruby.result(locals.merge(:env => env))
      STDOUT.puts "eruby locals: #{eruby.inspect}"
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, '')
      Roads.to_underscore(klass)
    end
  end
end