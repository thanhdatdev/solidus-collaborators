# frozen_string_literal: true

class Spree::CollaboratorsConfiguration < Spree::Preferences::Configuration
  def self.boolean_preferences
    %w(show_email)
  end

  preference :show_email, :boolean, default: false
end
