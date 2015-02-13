# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( phone_number: 07654321000, first_name: 'Jasper',  last_name: 'van der Valk', password: 'p@ssw0rd123',
             title: 'Mr', email: 'jasper.v.d.valk@gmail.com' )

Address.create( address_line_1: '65 Henshaw Street', address_line_2: '', town_city: 'London',
                post_code: 'SE171PE', county: 'Greater London' )

Property.create( price: 500000, number_of_bedrooms: 4, number_of_bathrooms: 2, number_of_receptions: 8, kitchen_type: 'big',
                 keyword: 'garage', property_type: 'attatched', status: 'sold', parking: 'requires permit',
                 outdoor_spaces: 'back garden', description: '18th century' )

Room.create( room_length: 45.55, room_width: 55.55, room_type: 'bedroom', measurement_unit: 'inches',
             description: 'master bedroom very nice' )