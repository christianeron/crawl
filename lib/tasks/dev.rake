desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Sample data task running"
  if Rails.env.development?
    User.destroy_all
    Location.destroy_all
    Crawl.destroy_all
    Stop.destroy_all
    Category.destroy_all
    Bookmark.destroy_all
    Visit.destroy_all
  end

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  # Create categories
  categories = ["Food and Drink","Sightseeing","Retail"]
  categories.each do |category_name|
    category = Category.new
    category.name = category_name
    category.save
  end

  # Create users
  usernames = ["alice","bob","carol","dave","eve"]
    usernames.each do |username|
      user = User.new
      user.email = "#{username}@example.com"
      user.password = "password"
      user.username = username
      user.save
    end


  # Create locations

    location = Location.new
    location.name = "Lou Malnati's Pizzeria"
    location.city = "Lincolnwood"
    location.state = "IL"
    location.street_address = "6649 N Lincoln Ave"
    location.zip_code = "60712"
    location.save

    location = Location.new
    location.name = "Pequod's Pizza"
    location.city = "Morton Grove"
    location.state = "IL"
    location.street_address = "8520 Fernald Ave"
    location.zip_code = "60053"
    location.save

    location = Location.new
    location.name = "Burt's Place"
    location.city = "Morton Grove"
    location.state = "IL"
    location.street_address = "8541 Ferris Ave"
    location.zip_code = "60053"
    location.save

    location = Location.new
    location.name = "Small Cheval"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "1732 N Milwaukee Ave"
    location.zip_code = "60647"
    location.save

    location = Location.new
    location.name = "Parson's Chicken & Fish"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "2952 W Armitage Ave"
    location.zip_code = "60647"
    location.save

    location = Location.new
    location.name = "Scofflaw"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "3201 W Armitage Ave"
    location.zip_code = "60647"
    location.save

    location = Location.new
    location.name = "Cloud Gate (The Bean)"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "Millennium Park, 201 E Randolph St"
    location.zip_code = "60602"
    location.save

    location = Location.new
    location.name = "The Chicago Picasso"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "Daley Plaza, 50 W Washington St"
    location.zip_code = "60602"
    location.save

    location = Location.new
    location.name = "Flamingo"
    location.city = "Chicago"
    location.state = "IL"
    location.street_address = "Federal Plaza, 50 W Adams St"
    location.zip_code = "60603"
    location.save

  # Create crawls and stops
    # Chicago - Food
    crawl = Crawl.new
    crawl.name = "Deep Dish Pizza"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[0]).at(0).id
    crawl.save

      #Stops
      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 1
      stop.location_id = Location.where(:name => "Lou Malnati's Pizzeria").at(0).id
      stop.recommendation = "Lou Malnati's is an iconic Chicago deep-dish pizza joint known for its buttery crust, tangy sauce, and gooey cheese. The Lincolnwood location offers a cozy atmosphere and consistently delicious pies."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 2
      stop.location_id = Location.where(:name => "Pequod's Pizza").at(0).id
      stop.recommendation = "Pequod's is famous for its unique caramelized crust, which adds a deliciously crunchy texture to its deep-dish pizzas. Located in Morton Grove, just a short drive from Lincolnwood, Pequod's is a must-visit for pizza enthusiasts."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 3
      stop.location_id = Location.where(:name => "Burt's Place").at(0).id
      stop.recommendation = "Another gem in Morton Grove, Burt's Place is renowned for its old-school atmosphere and mouthwatering pan pizzas. Burt's offers a variety of toppings, but the real star is the crispy yet chewy crust that keeps customers coming back for more."
      stop.save

    # Chicago - Food
    crawl = Crawl.new
    crawl.name = "French Fries"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[0]).at(0).id
    crawl.save

      #Stops
      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 1
      stop.location_id = Location.where(:name => "Small Cheval").at(0).id
      stop.recommendation = "Small Cheval offers fantastic fries to go with their renowned burgers. They're crispy, golden, and perfectly seasoned."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 2
      stop.location_id = Location.where(:name => "Parson's Chicken & Fish").at(0).id
      stop.recommendation = "Known for their fried chicken and patio atmosphere, Parson's also serves up some of the best fries in town. They're crispy on the outside, fluffy on the inside, and served with a side of tangy hot sauce."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 3
      stop.location_id = Location.where(:name => "Scofflaw").at(0).id
      stop.recommendation = "While primarily a cocktail bar, Scofflaw also offers delicious hand-cut fries. They're crispy, seasoned to perfection, and served with a side of garlic aioli."
      stop.save

    # Chicago - Art
    crawl = Crawl.new
    crawl.name = "Sculptures and Statues"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[1]).at(0).id
    crawl.save

      #Stops
      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 1
      stop.location_id = Location.where(:name => "Cloud Gate (The Bean)").at(0).id
      stop.recommendation = "Perhaps one of Chicago's most iconic landmarks, Cloud Gate, affectionately known as 'The Bean,' is a stainless steel sculpture located in Millennium Park. Designed by British artist Anish Kapoor, its reflective surface offers fascinating distortions of the city skyline and surrounding buildings."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 2
      stop.location_id = Location.where(:name => "The Chicago Picasso").at(0).id
      stop.recommendation = "The Chicago Picasso is a monumental sculpture by Pablo Picasso. Unveiled in 1967, it was the first monumental sculpture by the artist in the United States. Its abstract form has become a symbol of Chicago's public art scene."
      stop.save

      stop = Stop.new
      stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
      stop.order_number = 3
      stop.location_id = Location.where(:name => "Flamingo").at(0).id
      stop.recommendation = "Designed by American artist Alexander Calder, Flamingo is a striking red sculpture located in the Federal Plaza in the heart of the Loop. Its vibrant color and abstract form make it a prominent feature of the city's skyline."
      stop.save


  # Create bookmarks
  usernames.each do |username|
    user = User.where(:username => username).at(0)
    sample_crawls = Crawl.where.not(:user_id => user.id).sample(1)
    sample_crawls.each do |crawl|
      bookmark = Bookmark.new
      bookmark.user_id = user.id
      bookmark.crawl_id = crawl.id
      bookmark.save
    end
  end

  # Create visits
  user = User.where(:username => usernames[0]).at(0)
  crawls = Crawl.all

  crawls.each do |a_crawl|
    a_crawl.stops.each do |a_stop|
      visit = Visit.new
      visit.stop_id = a_stop.id
      visit.user_id = user.id
      visit.photo = Faker::Avatar.image
      visit.caption = Faker::Restaurant.review
      visit.rating = rand(1..5)
      visit.save
    end
  end

  # Summary
  puts "There are now #{User.count} rows in the user table."
  puts "There are now #{Category.count} rows in the category table."
  puts "There are now #{Location.count} rows in the category table."
  puts "There are now #{Crawl.count} rows in the crawl table."
  puts "There are now #{Stop.count} rows in the stop table."
  puts "There are now #{Bookmark.count} rows in the bookmark table."
  puts "There are now #{Visit.count} rows in the visit table."
end
