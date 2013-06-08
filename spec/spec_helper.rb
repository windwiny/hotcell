require 'puffer_markup'
require 'awesome_print'

AwesomePrint::Formatter.class_eval do
  def cast_with_puffer_markup_node(object, type)
    cast = cast_without_puffer_markup_node(object, type)
    cast = :puffer_markup_node if object.is_a?(PufferMarkup::Node)
    cast
  end

  def awesome_puffer_markup_node(object)
    "#{colorize(object.class.name, :class)} #{colorize(object.name.to_s, :method)} #{object.options.presence}" +
      awesome_array(object.children)
  end

  alias_method_chain :cast, :puffer_markup_node
end

RSpec::Matchers.define :be_equal_node_to do |expected|
  match do |actual|
    actual == expected
  end

  failure_message_for_should do |actual|
    "expected:\n#{expected.ai(raw: true, indent: 2)}\ngot:\n#{actual.ai(raw: true, indent: 2)}"
  end
end

RSpec.configure do |config|
  def data name
    File.read File.join(File.dirname(__FILE__), 'data', name)
  end

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end