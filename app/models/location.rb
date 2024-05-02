# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  city             :string
#  name             :string
#  state            :string
#  street_address   :string
#  street_address_2 :string
#  zip_code         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Location < ApplicationRecord
  # Validations
  validates(:name, presence:true)
  validates(:city, presence:true)
  validates(:state, presence:true)
  validates(:street_address, presence:true)
  validates(:zip_code, presence:true)

  # Direct associations
  has_many  :stops, class_name: "Stop", foreign_key: "location_id", dependent: :destroy

  # Indirect associations

end
