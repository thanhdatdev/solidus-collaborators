# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :collaborators, only: [:index, :destroy, :edit, :update]
  end
  resources :collaborators, only: [:new, :edit, :create, :show, :update]
end
