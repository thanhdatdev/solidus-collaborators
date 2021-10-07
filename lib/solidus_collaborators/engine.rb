# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusCollaborators
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_collaborators'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
