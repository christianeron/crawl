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
end
