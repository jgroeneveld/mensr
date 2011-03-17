# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

default_category_order = []

# ========= Unimensa =========

unimensa = Mensa.new
unimensa.name = "Unimensa"
unimensa.url = "http://www.studentenwerk.bremen.de/files/main_info/essen/plaene/uniessen.php"
unimensa.save!

essen1 = MenueCategory.create(name: :essen_1)
essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
unimensa.menue_categories << essen1
default_category_order << essen1.id

essen2 = MenueCategory.create(name: :essen_2)
essen2.parse_datas << CategoryParseData.create(row: 6, col: 1)
unimensa.menue_categories << essen2
default_category_order << essen2.id

wok = MenueCategory.create(name: :wok_und_pfanne)
wok.parse_datas << CategoryParseData.create(row: 30, col: 1)
unimensa.menue_categories << wok
default_category_order << wok.id

vegetarisch = MenueCategory.create(name: :vegetarisch)
vegetarisch.parse_datas << CategoryParseData.create(row: 20, col: 1)
unimensa.menue_categories << vegetarisch
default_category_order << vegetarisch.id

auflauf = MenueCategory.create(name: :auflaeufe_und_gratin)
auflauf.parse_datas << CategoryParseData.create(row: 22, col: 1)
auflauf.parse_datas << CategoryParseData.create(row: 24, col: 0)
auflauf.parse_datas << CategoryParseData.create(row: 26, col: 0)
auflauf.parse_datas << CategoryParseData.create(row: 28, col: 0)
unimensa.menue_categories << auflauf

# ========= GW2 =========

gw2 = Mensa.new
gw2.name = "GW 2"
gw2.url = "http://www.studentenwerk.bremen.de/files/main_info/essen/plaene/gw2essen.php"
gw2.save!

pizza = MenueCategory.create(name: :pizza)
pizza.parse_datas << CategoryParseData.create(row: 4, col: 1)
gw2.menue_categories << pizza
default_category_order << pizza.id

pasta = MenueCategory.create(name: :pasta)
pasta.parse_datas << CategoryParseData.create(row: 6, col: 1)
gw2.menue_categories << pasta
default_category_order << pasta.id

wok = MenueCategory.create(name: :wok_und_pfanne)
wok.parse_datas << CategoryParseData.create(row: 8, col: 1)
gw2.menue_categories << wok
default_category_order << wok.id

suppe = MenueCategory.create(name: :suppe)
suppe.parse_datas << CategoryParseData.create(row: 10, col: 1)
gw2.menue_categories << suppe
default_category_order << suppe.id

# ========= Werderstraße =========

werder = Mensa.new
werder.name = "Werderstraße"
werder.url = "http://www.studentenwerk.bremen.de/files/main_info/essen/plaene/weressen.php"
werder.save!

essen1 = MenueCategory.create(name: :essen_1)
essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
werder.menue_categories << essen1
default_category_order << essen1.id

essen2 = MenueCategory.create(name: :essen_2)
essen2.parse_datas << CategoryParseData.create(row: 6, col: 1)
werder.menue_categories << essen2
default_category_order << essen2.id

wok = MenueCategory.create(name: :wok_und_pfanne)
wok.parse_datas << CategoryParseData.create(row: 8, col: 1)
werder.menue_categories << wok
default_category_order << wok.id

# ========= Airportmensa =========

air = Mensa.new
air.name = "Airport"
air.url = "http://www.studentenwerk.bremen.de/files/main_info/essen/plaene/airessen.php"
air.save!

essen1 = MenueCategory.create(name: :essen_1)
essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
air.menue_categories << essen1
default_category_order << essen1.id

essen2 = MenueCategory.create(name: :essen_2)
essen2.parse_datas << CategoryParseData.create(row: 6, col: 1)
air.menue_categories << essen2
default_category_order << essen2.id
# ========= Neustadtswall =========

neustadt = Mensa.new
neustadt.name = "Hochschule am Neustadtswall"
neustadt.url = "http://www.studentenwerk.bremen.de/files/main_info/essen/plaene/hsbessen.php"
neustadt.save!

essen1 = MenueCategory.create(name: :essen_1)
essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
neustadt.menue_categories << essen1
default_category_order << essen1.id

essen2 = MenueCategory.create(name: :essen_2)
essen2.parse_datas << CategoryParseData.create(row: 6, col: 1)
neustadt.menue_categories << essen2
default_category_order << essen2.id

front = MenueCategory.create(name: :front_cooking)
front.parse_datas << CategoryParseData.create(row: 8, col: 1)
neustadt.menue_categories << front
default_category_order << front.id

bio = MenueCategory.create(name: :bio_menue)
bio.parse_datas << CategoryParseData.create(row: 10, col: 1)
neustadt.menue_categories << bio
default_category_order << bio.id



# ========= Defaults =========
defaults = Defaults.new
defaults.category_sort_order = default_category_order.join(",")
defaults.save