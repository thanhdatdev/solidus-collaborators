# frozen_string_literal: true

module Spree
  class CollaboratorsController < Spree::StoreController
    helper Spree::BaseHelper
    def show
      @collaborator = Spree::Collaborator.find(params[:id])
    end

    def new
      @collaborator = Spree::Collaborator.new
    end

    def edit
      @collaborator = Spree::Collaborator.find(params[:id])
    end

    def create
      @collaborator = Spree::Collaborator.new(collabs_params)
      if @collaborator.save
        flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
        redirect_to spree.collaborator_path(@collaborator)
      else
        render :new
      end
    end

    def update
      @collaborator = Spree::Collaborator.find(params[:id])

      if @collaborator.update(collabs_params)
        flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
        redirect_to spree.collaborator_path(@collaborator)
      else
        render :edit
      end
    end

    private

    def permitted_collabs_attributes
      [:name, :address, :phone_number, :email, :sex]
    end

    def collabs_params
      params.require(:collaborator).permit(permitted_collabs_attributes)
    end
  end
end
