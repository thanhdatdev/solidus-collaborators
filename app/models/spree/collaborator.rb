class Spree::Collaborator < ApplicationRecord
  attr_accessor :authenticity_token, :commit, :collaborator
end
