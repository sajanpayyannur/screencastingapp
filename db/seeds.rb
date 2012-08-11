# # encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


states =
  [['Alabama','AL'],
   ['Alaska','AK'],
   ['Alberta','AB'],
   ['Arizona','AZ'],
   ['Arkansas','AR'],
   ['British Columbia','BC'],
   ['California','CA'],
   ['Colorado','CO'],
   ['Connecticut','CT'],
   ['Delaware','DE'],
   ['District Of Columbia','DC'],
   ['Florida','FL'],
   ['Georgia','GA'],
   ['Hawaii','HI'],
   ['Idaho','ID'],
   ['Illinois','IL'],
   ['Indiana','IN'],
   ['Iowa','IA'],
   ['Kansas','KS'],
   ['Kentucky','KY'],
   ['Louisiana','LA'],
   ['Maine','ME'],
   ['Manitoba','MB'],
   ['Maryland','MD'],
   ['Massachusetts','MA'],
   ['Michigan','MI'],
   ['Minnesota','MN'],
   ['Mississippi','MS'],
   ['Missouri','MO'],
   ['Montana','MT'],
   ['Nebraska','NE'],
   ['Nevada','NV'],
   ['New Brunswick','NB'],
   ['New Hampshire','NH'],
   ['New Jersey','NJ'],
   ['New Mexico','NM'],
   ['New York','NY'],
   ['Newfoundland and Labrador','NL'],
   ['North Carolina','NC'],
   ['North Dakota','ND'],
   ['Northwest Territories','NT'],
   ['Nova Scotia','NS'],
   ['Nunavut','NU'],
   ['Ohio','OH'],
   ['Oklahoma','OK'],
   ['Ontario','ON'],
   ['Oregon','OR'],
   ['Pennsylvania','PA'],
   ['Prince Edward Island','PE'],
   ['Quebec','QC'],
   ['Rhode Island','RI'],
   ['Saskatchewan','SK'],
   ['South Carolina','SC'],
   ['South Dakota','SD'],
   ['Tennessee','TN'],
   ['Texas','TX'],
   ['Utah','UT'],
   ['Vermont','VT'],
   ['Virginia','VA'],
   ['Washington','WA'],
   ['West Virginia','WV'],
   ['Wisconsin','WI'],
   ['Wyoming','WY'],
   ['Yukon','YT'],
   ['Other','OT']]

  states.each do |state|
    State.create!(:name => state.first, :acronym => state.second) unless State.find_by_acronym(state.second)
  end
  puts "Created states....."

u = User.create!(
  :email => 'admin@admin.com',
  :password => '!mdnpasswd',
  :name => 'Admin The Owner',
  :address => "Address",
  :city => "City",
  :state_id => State.first.id,
  :zip => "00000",
  :admin => true,
  :nickname => 'The Admin',
  :description => 'Some blablabla bla bla bla bla about myself'
) unless User.find_by_email('admin@admin.com')
puts "Created Devise User....."

  menu_entry1 = Admin::MenuEntry.find_or_create_by_order(1){|m| m.title = 'Menu 1'}
  menu_entry1 = Admin::MenuEntry.find_or_create_by_order(2){|m| m.title = 'Menu 2'}
  menu_entry1 = Admin::MenuEntry.find_or_create_by_order(3){|m| m.title = 'Menu 3'}
  menu_entry1 = Admin::MenuEntry.find_or_create_by_order(4){|m| m.title = 'Menu 4'}

  page1 = Admin::Page.create! title: 'Home Page Block', publish: true, text: '<p><img src="http://images.copart.com/website/data/graphics/copart/Public_SalesList_1.jpg"    alt="" width="800" /></p>' unless Admin::Page.find_by_slug('home-page-block')
  page1 = Admin::Page.create! title: 'Footer', publish: true, text: '<p>The page Content goes <strong>here</strong></p>' unless Admin::Page.find_by_slug('footer')
  page1 = Admin::Page.create! title: 'Sidebar', publish: true, text: 'The page Content goes here' unless Admin::Page.find_by_slug('sidebar')
  page1 = Admin::Page.create! title: 'Footer Rights', publish: true, text: '© 2012 Auctions. All rights reserved.' unless Admin::Page.find_by_slug('footer-rights')


