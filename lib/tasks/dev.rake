namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
     Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph)
    end
    puts "create over"
    puts "#{Restaurant.count}"
  end
end