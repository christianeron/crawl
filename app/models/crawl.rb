# == Schema Information
#
# Table name: crawls
#
#  id          :integer          not null, primary key
#  city        :string
#  name        :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
class Crawl < ApplicationRecord
end
