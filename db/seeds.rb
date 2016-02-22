# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mod1 = Modifier.create!([{name: 'Add Egg', deltaPrice: 1.00}])
mod2 = Modifier.create!([{name: 'Add Green Onion', deltaPrice: 1.00}])

menu1 = MenuItem.create!([
    {name: 'Fried Rice', price: 12.50}
                         ])
menu2 = MenuItem.create!([
                             {name: 'Steam Rice', price: 10.50}
                         ])