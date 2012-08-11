desc "Creates default pages for the website"
task :create_pages => :environment do
  home = Admin::Page.new(publish: true, title: 'Home Page Block', text: 'The page Content goes here')
  puts "Home Page Block created" if home.save

  footer = Admin::Page.new(publish: true, title: 'Footer', text: 'The page Content goes here')
  puts "Footer Page Block created" if footer.save

  sidebar = Admin::Page.new(publish: true, title: 'Sidebar', text: 'The page Content goes here')
  puts "Side Page Block created" if sidebar.save

  betweenslide6list = Admin::Page.new(publish: true, title: 'Between Slide 6 List', text: 'The page Content goes here')
  puts "Between slider and 6 list block created" if betweenslide6list.save

  banner1 = Admin::Page.new(publish: true, title: 'Banner One', text: 'The page Content goes here')
  puts "Banner One Block created" if banner1.save

  banner2 = Admin::Page.new(publish: true, title: 'Banner Two', text: 'The page Content goes here')
  puts "Banner Two Block created" if banner2.save
end
