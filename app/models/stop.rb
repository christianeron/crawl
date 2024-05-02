# == Schema Information
#
# Table name: stops
#
#  id                  :integer          not null, primary key
#  menu_recommendation :text
#  order_number        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  crawl_id            :integer
#  location_id         :integer
#
class Stop < ApplicationRecord
end
