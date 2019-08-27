# frozen_string_literal: true

require "decidim/dev"

ENV["ENGINE_ROOT"] = File.dirname(__dir__)

Decidim::Dev.dummy_app_path = File.expand_path(File.join("spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"

Dir["#{__dir__}/rspec_support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include WaitForAjax
end
