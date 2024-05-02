# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  crawl_id      :integer
#  experience_id :integer
#
class Tag < ApplicationRecord
  
  # Direct associations
  belongs_to :crawl, required: true, class_name: "Crawl", foreign_key: "crawl_id"

  belongs_to :experience, required: true, class_name: "Experience", foreign_key: "experience_id"
  
  # Indirect associations
  
end
