# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#
Sys::User.create(:login_name => 'suxiaohun',:name=>'小苏',:mobile=>'18888888888', :password => Sys::User.encrypt_password('111111'))







