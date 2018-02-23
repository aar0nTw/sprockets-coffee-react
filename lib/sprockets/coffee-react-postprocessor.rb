require 'sprockets'
require 'tilt'
require 'coffee-react'

module Sprockets
  class CoffeeReactPostprocessor < Tilt::Template

    def self.call(input)
      { data: ::CoffeeReact.jstransform(input[:data]) }
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      ::CoffeeReact.jstransform(data)
    end
  end
end
