Dir[Rails.root.join('db/seeds_dev/*.rb')].sort.each do |file|
    puts "Processing #{file.split('/').last}"
    require file
end

Dir[Rails.root.join('db/seeds_test/*.rb')].sort.each do |file|
    puts "Processing #{file.split('/').last}"
    require file
end
