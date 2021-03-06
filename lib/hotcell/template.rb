module Hotcell
  class Template
    attr_reader :source, :options

    def self.parse source
      new source,
        commands: Hotcell.commands,
        blocks: Hotcell.blocks,
        escape_tags: Hotcell.escape_tags
    end

    def initialize source, options = {}
      @source = Source.wrap(source, options.delete(:file))
      @options = options
    end

    def syntax
      @syntax ||= Parser.new(source, options.slice(:commands, :blocks, :escape_tags)).parse
    end

    def render context = {}
      if context.is_a?(Context)
        syntax.render(context)
      else
        default_context = { helpers: Hotcell.helpers }
        syntax.render(Context.new(default_context.merge!(context)))
      end
    end

    def render! context = {}
      if context.is_a?(Context)
        context.options[:reraise] = true
        render context
      else
        render context.merge(reraise: true)
      end
    end
  end
end
