# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( firstName: 'Jasper',  lastName: 'van der Valk', password: 'p@ssw0rd123', title: 'Mr', email: 'jasper.v.d.valk@gmail.com' )
Address.create( addressLine1: '65 Henshaw Street', addressLine2: '', townCity: 'London', postCode: 'SE171PE', county: '', country: 'England' )
Property.create( price: 500000, numberBedroom: 4, numberBathroom: 2, numberRoom: 8, keyword: 'garage', description: '18th century', type: 'attatched' )