# == Schema Information
#
# Table name: stops
#
#  id             :integer          not null, primary key
#  order_number   :integer
#  recommendation :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  crawl_id       :integer
#  location_id    :integer
#
class Stop < ApplicationRecord
    # Validations
    validates(:order_number, presence:true)
    validates(:recommendation, presence:true)

  # Direct associations
  belongs_to :crawl, required: true, class_name: "Crawl", foreign_key: "crawl_id"

  has_many  :stop_comments, class_name: "StopComment", foreign_key: "stop_id", dependent: :destroy

  has_many  :visits, class_name: "Visit", foreign_key: "stop_id", dependent: :destroy

  belongs_to :location, required: true, class_name: "Location", foreign_key: "location_id"
  
  # Indirect associations
  
end
