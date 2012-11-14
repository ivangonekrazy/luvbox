# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

papa = User.create({
        name: "Papa Hugs",
        email: "papa@luvbox",
        zodiac_west: "Aries",
        zodiac_chinese: "Dragon"
})

mama = User.create({
        name: "Mama Kisses",
        email: "mama@luvbox",
        zodiac_west: "Virgo",
        zodiac_chinese: "Tiger"
})

papa.give_luv_to(mama, "Happy Mother's Day!")
