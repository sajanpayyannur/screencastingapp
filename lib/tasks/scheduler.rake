require 'mechanize'
require 'copart_bot'

desc "This task is called by the Heroku scheduler add-on"

# You may simulate the import action with a smaller file. Without having to go online fetch any data.
# Just use a csv file from your local file system like this:
#
#   csv_file = CSVParser.new(nil, nil, File.open("#{Rails.root}/tmp/salesdata.csv"))
#
# Goes to copart.com import a CSV file and upload it to s3
task :csv_import => :environment do

  bot = CopartBot.new
  bot.login

  puts "Downloading csv file from copart.com. This may take a while..."
  csv_file = bot.get_csv_file
  csv_file.import_csv

  # "Upload imported file to s3. This may take a while..."
  # csv_model_instance = Csvfile.new(csv: File.open("#{Rails.root}/tmp/#{csv_file.filename}"))
  # if csv_model_instance.save
  #   puts "CSV file successfully uploaded"
  # else
  #   puts "Something went wrong. File was not uploaded"
  # end
end
