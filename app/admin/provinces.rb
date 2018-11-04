ActiveAdmin.register Province do
  permit_params :name, :code, :rate_type, :province_code, :canada_code
end
