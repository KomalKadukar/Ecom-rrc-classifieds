require 'csv'

province_csv = Rails.root.join('lib', 'seeds', 'Provinces_Taxes.csv')

AdminUser.create!(email: 'komalkadukar@ecomrrc.com', password: 'password!', password_confirmation: 'password!')
puts "There are now #{AdminUser.count} rows in the AdminUser table."

# ProgramClassified.destroy_all
# OrderClassified.destroy_all
# Order.destroy_all
# Classified.destroy_all
# Student.destroy_all
# Province.destroy_all
# Category.destroy_all
# Program.destroy_all
# Status.destroy_all

# CSV.foreach(province_csv, headers: true) do |row|
#   # puts row.to_hash
#   Province.create(name: row['name'],
#                   code: row['code'],
#                   rate_type: row['rate_type'],
#                   province_rate: row['province_rate'],
#                   canada_rate: row['canada_rate'])
# end

# Category.create([{ name: 'Books' },
#                   { name: 'Cables' }])
# Program.create([{ name: "Business Information Technology"},
#                 { name: "Business Technology Management"}])
# Status.create(name: 'Pending')

# 2.times do
#   first_name = Faker::Name.unique.first_name
#   last_name = Faker::Name.unique.last_name

#   Student.create(
#     name: "#{first_name} #{last_name}",
#     number: Faker::Number.unique.number(7),
#     email: "#{first_name.downcase}.#{last_name.downcase}@academic.rrc.ca",
#     address: Faker::Address.unique.street_address,
#     city: 'Calgary',
#     province: Province.first
#   )
# end

# Classified.create(
#   item: 'Mathematics Book',
#   price: 30.25,
#   description: 'Required for 1st term in BIT.',
#   category: Category.first,
#   student: Student.first,
#   admin_ad: false,
#   sold: false
# )

# Classified.create(
#   item: 'USB to VGA convertor cable',
#   price: 15,
#   description: 'Required in 2nd term for networking course.',
#   category: Category.second,
#   student: Student.second,
#   admin_ad: false,
#   sold: false
# )

# ProgramClassified.create(program: Program.first, classified: Classified.first)

# puts "There are now #{Province.count} rows in the provinces table."
# puts "There are now #{Category.count} rows in the categories table."
# puts "There are now #{Program.count} rows in the programs table."
# puts "There are now #{Status.count} rows in the status table."
# puts "There are now #{Student.count} rows in the students table."
# puts "There are now #{Classified.count} rows in the classifieds table."
# puts "There are now #{ProgramClassified.count} rows in the program_classifieds table."

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
