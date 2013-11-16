# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'selenium-webdriver'
require 'capybara/rspec'
require 'debugger'

# capybara/rspec runs some RSpec configuration that assumes it should apply
# only to examples of type :feature
# all specs in this suite are features
class RSpec::Core::Metadata
  alias_method :__initialize__, :initialize
  def initialize *args
    __initialize__(*args).tap do
      self[:type] = :feature
    end
  end
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each do |f|
  pathname = Pathname.new(f)
  puts "including spec support: #{pathname.relative_path_from(Pathname.new(File.dirname(__FILE__)))}"
  require f
end

RSpec.configure do |config|

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  #config.extend UI
  config.include Habits
end
