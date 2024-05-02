# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  crawl_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :crawl, required: true, class_name: "Crawl", foreign_key: "crawl_id"
  
  # Indirect associations
  
end
