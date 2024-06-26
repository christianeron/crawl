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
    StopComment.destroy_all
    VisitComment.destroy_all
    Experience.destroy_all
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

  # Create experiences
  experiences = ["Pizza", "Hot Dogs", "French Fries", "Burgers", "Sushi", "Tacos", "Pasta", "Salad", "Steak", "Chicken Wings", "Ramen", "Sandwiches", "Ice Cream", "Curry", "Dim Sum", "Sushi Burrito", "Barbecue Ribs", "Fish and Chips", "Pad Thai", "Falafel"]
  experiences.each do |experience_name|
    experience = Experience.new
    experience.name = experience_name
    experience.save
  end

  # Create users
  usernames = ["alice","bob","carol","dave","eve","frank","grace","heidi","ivan","judy","mallory","nancy","olivia","peter"]
    usernames.each do |username|
      user = User.new
      user.email = "#{username}@example.com"
      user.password = "password"
      user.username = username
      user.save
    end

  # Create locations
    locations = Array.new
    locations = locations.push({:name => "Lou Malnati's Pizzeria", :city => "Lincolnwood", :state => "IL", :street_address => "6649 N Lincoln Ave", :zip_code => "60712"})
    locations = locations.push({:name => "Pequod's Pizza", :city => "Morton Grove", :state => "IL", :street_address => "8520 Fernald Ave", :zip_code => "60053"})
    locations = locations.push({:name => "Burt's Place", :city => "Morton Grove", :state => "IL", :street_address => "8541 Ferris Ave", :zip_code => "60053"})
    locations = locations.push({:name => "Small Cheval", :city => "Chicago", :state => "IL", :street_address => "1732 N Milwaukee Ave", :zip_code => "60647"})
    locations = locations.push({:name => "Parson's Chicken & Fish", :city => "Chicago", :state => "IL", :street_address => "2952 W Armitage Ave", :zip_code => "60647"})
    locations = locations.push({:name => "Scofflaw", :city => "Chicago", :state => "IL", :street_address => "3201 W Armitage Ave", :zip_code => "60647"})
    locations = locations.push({:name => "Cloud Gate (The Bean)", :city => "Chicago", :state => "IL", :street_address => "Millennium Park, 201 E Randolph St", :zip_code => "60602"})
    locations = locations.push({:name => "The Chicago Picasso", :city => "Chicago", :state => "IL", :street_address => "Daley Plaza, 50 W Washington St", :zip_code => "60602"})
    locations = locations.push({:name => "Flamingo", :city => "Chicago", :state => "IL", :street_address => "Federal Plaza, 50 W Adams St", :zip_code => "60603"})

    locations.each do |a_location|
      location = Location.new
      location.name = a_location.fetch(:name)
      location.city = a_location.fetch(:city)
      location.state = a_location.fetch(:state)
      location.street_address = a_location.fetch(:street_address)
      location.zip_code = a_location.fetch(:zip_code)
      location.save
    end

  # Create crawls and stops

    crawls = Array.new
    crawls = crawls.push(:name => "Deep Dish Pizza", :city => "Chicago", :state => "IL", :category_id => Category.all.where(:name => categories[0]).at(0).id, :photo_url => "https://images.unsplash.com/photo-1582476927499-65372fb1a458?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hpY2FnbyUyMHBpenphfGVufDB8fDB8fHwy")
    crawls = crawls.push(:name => "French Fries", :city => "Chicago", :state => "IL", :category_id => Category.all.where(:name => categories[0]).at(0).id, :photo_url => "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZnJlbmNoJTIwZnJpZXN8ZW58MHx8MHx8fDI%3D")
    crawls = crawls.push(:name => "Sculptures and Statues", :city => "Chicago", :state => "IL", :category_id => Category.all.where(:name => categories[1]).at(0).id, :photo_url => "https://images.unsplash.com/photo-1616624446421-b6a136da737d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpY2FnbyUyMGJlYW58ZW58MHx8MHx8fDI%3D")

    stops = Array.new
    stops = stops.push(:crawl_name => "Deep Dish Pizza", :order_number => 1, :location_name => "Lou Malnati's Pizzeria", :recommendation => "Lou Malnati's is an iconic Chicago deep-dish pizza joint known for its buttery crust, tangy sauce, and gooey cheese. The Lincolnwood location offers a cozy atmosphere and consistently delicious pies.")
    stops = stops.push(:crawl_name => "Deep Dish Pizza", :order_number => 2, :location_name => "Pequod's Pizza", :recommendation => "Pequod's is famous for its unique caramelized crust, which adds a deliciously crunchy texture to its deep-dish pizzas. Located in Morton Grove, just a short drive from Lincolnwood, Pequod's is a must-visit for pizza enthusiasts.")
    stops = stops.push(:crawl_name => "Deep Dish Pizza", :order_number => 3, :location_name => "Burt's Place", :recommendation => "Another gem in Morton Grove, Burt's Place is renowned for its old-school atmosphere and mouthwatering pan pizzas. Burt's offers a variety of toppings, but the real star is the crispy yet chewy crust that keeps customers coming back for more.")

    stops = stops.push(:crawl_name => "French Fries", :order_number => 1, :location_name => "Small Cheval", :recommendation => "Small Cheval offers fantastic fries to go with their renowned burgers. They're crispy, golden, and perfectly seasoned.")
    stops = stops.push(:crawl_name => "French Fries", :order_number => 2, :location_name => "Parson's Chicken & Fish", :recommendation => "Known for their fried chicken and patio atmosphere, Parson's also serves up some of the best fries in town. They're crispy on the outside, fluffy on the inside, and served with a side of tangy hot sauce.")
    stops = stops.push(:crawl_name => "French Fries", :order_number => 3, :location_name => "Scofflaw", :recommendation => "While primarily a cocktail bar, Scofflaw also offers delicious hand-cut fries. They're crispy, seasoned to perfection, and served with a side of garlic aioli.")

    stops = stops.push(:crawl_name => "Sculptures and Statues", :order_number => 1, :location_name => "Cloud Gate (The Bean)", :recommendation => "Perhaps one of Chicago's most iconic landmarks, Cloud Gate, affectionately known as 'The Bean,' is a stainless steel sculpture located in Millennium Park. Designed by British artist Anish Kapoor, its reflective surface offers fascinating distortions of the city skyline and surrounding buildings.")
    stops = stops.push(:crawl_name => "Sculptures and Statues", :order_number => 2, :location_name => "Flamingo", :recommendation => "Designed by American artist Alexander Calder, Flamingo is a striking red sculpture located in the Federal Plaza in the heart of the Loop. Its vibrant color and abstract form make it a prominent feature of the city's skyline.")
    stops = stops.push(:crawl_name => "Sculptures and Statues", :order_number => 3, :location_name => "The Chicago Picasso", :recommendation => "The Chicago Picasso is a monumental sculpture by Pablo Picasso. Unveiled in 1967, it was the first monumental sculpture by the artist in the United States. Its abstract form has become a symbol of Chicago's public art scene.")



    crawls.each do |a_crawl|
      crawl = Crawl.new
      crawl.name = a_crawl.fetch(:name)
      crawl.city = a_crawl.fetch(:city)
      crawl.state = a_crawl.fetch(:state)
      crawl.user_id = User.all.sample.id
      crawl.category_id = a_crawl.fetch(:category_id)
      crawl.photo = URI.open(a_crawl.fetch(:photo_url))
      crawl.save
      
      stops.each do |a_stop|
        if a_stop.fetch(:crawl_name) == crawl.name
          stop = Stop.new
          stop.crawl_id = Crawl.where(:name => crawl.name).at(0).id
          stop.order_number = a_stop.fetch(:order_number)
          stop.location_id = Location.where(:name => a_stop.fetch(:location_name)).at(0).id
          stop.recommendation = a_stop.fetch(:recommendation)
          stop.save
        end
      end
    end
      
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

  positive_comments = [
    "Absolutely delicious! Every bite was a burst of flavor.",
    "Mouthwatering dishes that left me craving more.",
    "Fantastic food, great atmosphere, and excellent service!",
    "The presentation was stunning, and the taste matched it perfectly.",
    "Incredible flavors that danced on my palate.",
    "Fresh ingredients and impeccable seasoning made for an unforgettable meal.",
    "A culinary masterpiece from start to finish.",
    "Every dish was a delightful surprise!",
    "I couldn't get enough of their amazing cuisine.",
    "The perfect balance of textures and flavors.",
    "A delightful dining experience that exceeded all expectations.",
    "Exquisite food that left me feeling satisfied and content.",
    "Each bite was like a taste of heaven.",
    "Wonderful food paired with exceptional service.",
    "An absolute gem for food lovers!",
    "My taste buds were treated to a symphony of flavors.",
    "I'll definitely be coming back for more!",
    "A culinary adventure that I didn't want to end.",
    "Every dish was a work of art.",
    "Delicious food served with a smile.",
    "An outstanding dining experience that I'll never forget.",
    "The quality of the ingredients really shone through in every dish.",
    "I left with a full stomach and a happy heart.",
    "One word: perfection.",
    "Absolutely delectable! I can't wait to return for another meal."
  ]

  negative_comments = [
    "The food was amazing, but the location is quite a trek.",
    "Delicious dishes, but wish the location was more convenient.",
    "Fantastic flavors, but the distance from my place is a downside.",
    "The food exceeded my expectations, but the remote location was a drawback.",
    "Incredible cuisine, but the distance made it a bit of a hassle.",
    "I loved the food, but the location was farther than I anticipated.",
    "The dishes were divine, but I wish the restaurant was closer to home.",
    "Exceptional taste, but the remote location was a bit inconvenient.",
    "The food was top-notch, but the distance was a bit of a deterrent.",
    "Absolutely delicious food, but the far-off location was a downside."
  ]
  
  art_comments = [
    "The sculpture was breathtaking, capturing my imagination instantly.",
    "I was mesmerized by the intricate details of the sculpture.",
    "The sculpture evoked a sense of wonder and awe.",
    "It was truly a masterpiece, showcasing the artist's skill and creativity.",
    "The sculpture added beauty and charm to its surroundings.",
    "I found myself drawn to the sculpture, unable to look away.",
    "The sculpture's form and composition were simply stunning.",
    "It was a delight to experience the sculpture from different angles.",
    "The sculpture resonated with me on a deep emotional level.",
    "I was inspired by the sculpture's profound symbolism and meaning."
  ]


  pizza_photos = ["https://images.unsplash.com/photo-1601925228316-1225f01caa12?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWF0JTIwcGl6emF8ZW58MHx8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVhdCUyMHBpenphfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1615343323503-0b0639fa4c94?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZWF0JTIwcGl6emF8ZW58MHx8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1489564239502-7a532064e1c2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBpenphJTIwcmVzdGF1cmFudHxlbnwwfHwwfHx8Mg%3D%3D",
    "https://images.unsplash.com/photo-1595060094020-734d7fb273ca?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBpenphJTIwcmVzdGF1cmFudHxlbnwwfHwwfHx8Mg%3D%3D",
    "https://images.unsplash.com/photo-1614442042855-e17d53875286?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODR8fGVhdCUyMHBpenphfGVufDB8fDB8fHwy"
  ]

  fry_photos = ["https://images.unsplash.com/photo-1484009902830-a314db11070c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGVhdCUyMGZyZW5jaCUyMGZyaWVzfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1686574086026-9f02b82f4765?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fGVhdCUyMGZyZW5jaCUyMGZyaWVzfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1625940947539-6d4702b302a2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fGVhdCUyMGZyZW5jaCUyMGZyaWVzfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1662703752588-718bfdeef5fb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzN8fGVhdCUyMGZyZW5jaCUyMGZyaWVzfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1666304752980-678d5c35c911?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTc1fHxlYXQlMjBmcmVuY2glMjBmcmllc3xlbnwwfHwwfHx8Mg%3D%3D",
    "https://images.unsplash.com/photo-1684815495679-f6e6bc0634ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTk1fHxlYXQlMjBmcmVuY2glMjBmcmllc3xlbnwwfHwwfHx8Mg%3D%3D"
  ]

  bean_photos = ["https://images.unsplash.com/photo-1622180790662-cdb3cedaa463?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2hpY2FnbyUyMGJlYW58ZW58MHx8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1612806955679-25a68ebab807?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hpY2FnbyUyMGJlYW58ZW58MHx8MHx8fDI%3D",
    "https://images.unsplash.com/photo-1549533948-77ab8a0d9878?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2hpY2FnbyUyMGJlYW58ZW58MHx8MHx8fDI%3D"
]

  flamingo_photos = ["https://images.unsplash.com/photo-1539314665496-6755291e8000?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpY2FnbyUyMGZsYW1pbmdvfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1539408166570-aaa7e9dcc1e0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2hpY2FnbyUyMGZsYW1pbmdvfGVufDB8fDB8fHwy",
    "https://images.unsplash.com/photo-1579728086678-43b0c5e49cab?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2hpY2FnbyUyMGZsYW1pbmdvfGVufDB8fDB8fHwy"
  ]

  2.times {
    crawls.each do |a_crawl|
      a_user = User.all.sample(1).at(0)
      a_crawl.stops.each do |a_stop|
        visit = Visit.new
        visit.stop_id = a_stop.id
        visit.user_id = a_user.id
        if a_crawl.name == "Deep Dish Pizza"
          visit.caption = negative_comments.sample(1).at(0)
          a_photo = pizza_photos.sample(1).at(0)
          a_photo_position = pizza_photos.index(a_photo)
          pizza_photos.delete_at(a_photo_position)
          visit.photo = URI.open(a_photo)
        elsif a_crawl.name == "French Fries"
          visit.caption = positive_comments.sample(1).at(0)
          a_photo = fry_photos.sample(1).at(0)
          a_photo_position = fry_photos.index(a_photo)
          fry_photos.delete_at(a_photo_position)
          visit.photo = URI.open(a_photo)
        else
          visit.caption = art_comments.sample(1).at(0)
          if a_stop.location.name == "Cloud Gate (The Bean)"
            a_photo = bean_photos.sample(1).at(0)
            a_photo_position = bean_photos.index(a_photo)
            bean_photos.delete_at(a_photo_position)
            visit.photo = URI.open(a_photo)
          elsif a_stop.location.name == "Flamingo"
            a_photo = flamingo_photos.sample(1).at(0)
            a_photo_position = flamingo_photos.index(a_photo)
            flamingo_photos.delete_at(a_photo_position)
            visit.photo = URI.open(a_photo)
          end
        end

        if a_crawl.name == "Deep Dish Pizza"
          visit.rating = rand(1..3)
        else
          visit.rating = rand(3..5)
        end
        visit.save
      end
    end
  }

  # Create visit comments
  visits = Visit.all
  visits.each do |a_visit|
    3.times do
      visit_comment = VisitComment.new
      visit_comment.user_id = User.where.not(:id => a_visit.user.id).sample(1).at(0).id
      visit_comment.visit_id = a_visit.id
      visit_comment.comment = Faker::Movies::PrincessBride.quote
      visit_comment.save

    end
  end

  # Summary
  puts "There are now #{User.count} rows in the user table."
  puts "There are now #{Category.count} rows in the category table."
  puts "There are now #{Experience.count} rows in the experience table."
  puts "There are now #{Location.count} rows in the location table."
  puts "There are now #{Crawl.count} rows in the crawl table."
  puts "There are now #{Stop.count} rows in the stop table."
  puts "There are now #{Bookmark.count} rows in the bookmark table."
  puts "There are now #{Visit.count} rows in the visit table."
  puts "There are now #{VisitComment.count} rows in the visit comment table."
  puts "There are now #{StopComment.count} rows in the stop comment table."
end
