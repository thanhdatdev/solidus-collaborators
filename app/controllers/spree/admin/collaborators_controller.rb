# frozen_string_literal: true

module Spree
  module Admin
    class CollaboratorsController < Spree::Admin::ResourceController
      def index
        @collaborators = collection
      end

      def edit
        @collaborator = Spree::Collaborator.find(params[:id])
        authorize! :update, @collaborator
      end

      def update
        @collaborator = Spree::Collaborator.find(params[:id])

        authorize! :update, @collaborator
        if @collaborator.update(collabs_params)
          flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
          redirect_to spree.collaborator_path(@collaborator)
        else
          render :edit
        end
      end

      private

      def permitted_collabs_attributes
        %i[name address phone_number email sex]
      end

      def collabs_params
        params.require(:collaborator).permit(permitted_collabs_attributes)
      end

      def collection
        params[:q] ||= {}

        @search = Spree::Collaborator.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end
    end
  end
end
