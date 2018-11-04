ActiveAdmin.register Classified do
  permit_params :item, :price, :description, :category, :student_id
end
