# frozen_string_literal: true

module Spree
  module PermissionSets
    class CollaboratorManagement < PermissionSets::Base
      def activate!
        can :manage, Spree::Collaborator
      end
    end
  end
end
