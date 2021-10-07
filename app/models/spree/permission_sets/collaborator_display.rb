# frozen_string_literal: true

module Spree
  module PermissionSets
    class CollaboratorDisplay < PermissionSets::Base
      def activate!
        can [:display, :admin], Spree::Collaborator
      end
    end
  end
end
