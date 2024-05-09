# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
    # Validations
    validates(:name, presence:true)

  # Direct associations
  has_many  :crawls, class_name: "Crawl", foreign_key: "category_id", dependent: :destroy
  
  # Indirect associations
  
end
