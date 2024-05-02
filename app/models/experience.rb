# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Experience < ApplicationRecord
  # Validations
  validates(:name, presence:true)

  # Direct associations
  has_many  :tags, class_name: "Tag", foreign_key: "experience_id", dependent: :destroy

  # Indirect associations
  has_many :crawls, through: :tags, source: :crawl
  
end
