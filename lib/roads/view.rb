require 'erubis'

module Roads
  class View
    def initialize(controller, view_name)
      # STDOUT.puts '*' * 100
      # STDOUT.puts "controller: #{controller.instance_variables}"
      
      filename = File.join('app', 'views', controller.controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      STDOUT.puts "eruby result: #{eruby.result}"
      # eruby.result(locals.merge(:env => env))
    end
  end
end