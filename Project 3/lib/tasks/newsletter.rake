namespace :newsletter do
  desc "Send Newsletter"
  task :send => :environment do 
    Pin.send_newsletter
  end
end
