# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :username, uniqueness: true, presence: true, length: { minimum: 3,
  too_short: "%{count} characters is the minimum allowed" }
  

  # Direct associations
  has_many  :bookmarks, class_name: "Bookmark", foreign_key: "user_id", dependent: :destroy

  has_many  :stop_comments, class_name: "StopComment", foreign_key: "user_id", dependent: :destroy

  has_many  :visit_comments, class_name: "VisitComment", foreign_key: "user_id", dependent: :destroy

  has_many  :visits, class_name: "Visit", foreign_key: "user_id", dependent: :destroy

  has_many  :crawls, class_name: "Crawl", foreign_key: "user_id", dependent: :destroy

  # Indirect associations
  has_many :bookmarked_crawls, through: :bookmarks, source: :crawl
  
end
