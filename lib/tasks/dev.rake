desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Sample data task running"
  if Rails.env.development?
    Board.destroy_all
    Post.destroy_all
  end

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  categories = ["Food and Bars","Sightseeing","Retail"]
  categories.each |category_name| do
    category = Category.new
    category.name = category_name
    category.save
  end
  
  usernames = ["alice","bob","carol","dave","eve"]
    usernames.each do |username|
      user = User.new
      user.email = "#{username}@example.com"
      user.password = "password"
      user.username = username
      user.save
    end

  categories.each |category_name| 2.times do
    crawl = Crawl.new
    crawl.name = Faker::

end
