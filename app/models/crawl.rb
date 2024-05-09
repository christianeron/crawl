# == Schema Information
#
# Table name: crawls
#
#  id          :integer          not null, primary key
#  city        :string
#  name        :string
#  photo       :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
class Crawl < ApplicationRecord
  mount_uploader :photo, CrawlPhotoUploader
  
  # Validations
  validates(:name, presence:true)
  validates(:city, presence:true)
  validates(:state, presence:true)
  validates(:photo, presence:true)

  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "crawl_id", dependent: :destroy

  has_many  :tags, class_name: "Tag", foreign_key: "crawl_id", dependent: :destroy

  has_many  :stops, class_name: "Stop", foreign_key: "crawl_id", dependent: :destroy

  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id"

  # Indirect associations
  has_many :experiences, through: :tags, source: :experience

  has_many :following_users, through: :bookmarks, source: :user

  has_many :visits, through: :stops, source: :visits
end
