ActiveAdmin.register Student do
  permit_params :name, :number, :email, :address, :city, :province_id
end
