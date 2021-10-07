# frozen_string_literal: true

class Spree::CollaboratorsAbility
  include CanCan::Ability

  def initialize(user)
    collaborator_ability_class = self.class

    user ||= Spree::Collaborator.new # guest user (not logged in)

    if user
      can :create, :edit, :update, Spree::Collaborators
    else
      can :manage, :all
    end
  end
end
