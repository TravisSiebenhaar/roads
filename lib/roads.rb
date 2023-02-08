# frozen_string_literal: true

require_relative "roads/version"
require 'roads/array'

module Roads
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ['Hello, from Ruby on Roads!']]
    end
  end
end
