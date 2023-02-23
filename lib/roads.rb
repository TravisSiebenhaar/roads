# frozen_string_literal: true

require "roads/version"
require 'roads/routing'
require 'roads/array'
require 'roads/util'
require 'roads/dependencies'
require 'roads/controller'
require 'roads/file_model'

module Roads
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end

    def self.framework_root
      __DIR__
    end
  end
end
