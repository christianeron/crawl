desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Sample data task running"
  if Rails.env.development?
    User.destroy_all
    Crawl.destroy_all
    Category.destroy_all
    Bookmark.destroy_all 
  end

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  # Create categories
  categories = ["Food and Bars","Sightseeing","Retail"]
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

  # Create crawls
  locations = Array.new
  locations = locations.push(["Chicago","IL"])
  locations = locations.push(["New York","NY"])
  locations = locations.push(["Denver","CO"])

    # Chicago - Food
    crawl = Crawl.new
    crawl.name = "Deep Dish Pizza"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[0]).at(0).id
    crawl.save

    # Chicago - Food
    crawl = Crawl.new
    crawl.name = "French Fries"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[0]).at(0).id
    crawl.save

    # Chicago - Art
    crawl = Crawl.new
    crawl.name = "Sculptures and Statues"
    crawl.city = "Chicago"
    crawl.state = "IL"
    crawl.user_id = User.all.sample.id
    crawl.category_id = Category.all.where(:name => categories[1]).at(0).id
    crawl.save


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

  # Summary
  puts "There are now #{User.count} rows in the user table."
  puts "There are now #{Category.count} rows in the category table."
  puts "There are now #{Crawl.count} rows in the crawl table."
  puts "There are now #{Bookmark.count} rows in the bookmark table."
end
