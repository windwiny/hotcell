module Hotcell
  class Node
    attr_accessor :name, :children, :options

    def self.build *args
      new(*args).optimize
    end

    def initialize name, *args
      @name = name
      @options = args.extract_options!
      @children = args
    end

    def optimize
      self
    end

    def [] key
      children[key]
    end

    def render context
      process context, *render_nodes(context, children)
    end

    def process context, *values
      raise NotImplementedError
    end

    def render_nodes context, *values
      values.flatten.map do |node|
        node.is_a?(Hotcell::Node) ? node.render(context) : node
      end
    end

    def == other
      other.is_a?(self.class) &&
      name == other.name &&
      options == other.options &&
      children == other.children
    end
  end
end

require 'hotcell/node/calculator'
require 'hotcell/node/assigner'
require 'hotcell/node/summoner'
require 'hotcell/node/arrayer'
require 'hotcell/node/hasher'
require 'hotcell/node/sequencer'
require 'hotcell/node/joiner'
require 'hotcell/node/tag'
require 'hotcell/node/command'
require 'hotcell/node/block'