# frozen_string_literal: true

Spree::Backend::Config.configure do |config|
  config.menu_items.detect { |menu_item|
    menu_item.label == :products
  }.sections << :collaborators
end

Deface::Override.new(
  virtual_path: "spree/admin/shared/_product_sub_menu",
  name: "collaborators_admin_tab",
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  disabled: false
) do
  <<-HTML
    <% if can? :admin, Spree::Collaborator %>
      <%= tab(:collaborators) %>
    <% end %>
  HTML
end

# frozen_string_literal: true

# Deface::Override.new(
#   virtual_path: "spree/layouts/admin",
#   name: "collaborators_admin_tab",
#   insert_bottom: "[data-hook='admin_tabs']",
#   disabled: false
# ) do
#   <<-HTML
#     <% if can? :admin, Spree::Collaborator %>
#       <%= tab(:collaborators) %>
#     <% end %>
#   HTML
# end
