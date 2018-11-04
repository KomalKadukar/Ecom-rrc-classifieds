ActiveAdmin.register Classified do
  permit_params :item, :price, :description, :category_id, :student_id, :admin_ad, :sold
end
