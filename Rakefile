require_relative './config/environment.rb'

 def reload!
    load_all './lib'
 end

desc 'console to get into pry'
task :console do
    Pry.start
end

task :scrape_rooms do
    bellingham = RoomScraper.new('https://bellingham.craigslist.org/search/roo')
    bellingham.call
end 