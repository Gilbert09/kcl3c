# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( first_name: 'Jasper',  last_name: 'van der Valk', password: 'p@ssw0rd123',
             title: 'Mr', email: 'jasper.v.d.valk@gmail.com' )
Address.create( address_line_1: '65 Henshaw Street', address_line_2: '', town_city: 'London',
                post_code: 'SE171PE', county: '', country: 'England' )
Property.create( price: 500000, number_of_bedrooms: 4, number_of_bathrooms: 2, number_of_receptions: 8,
                 keyword: 'garage', description: '18th century', property_type: 'attatched',
                 status: 'sold', parking: 'requires permit', outdoor_spaces: 'back garden' )