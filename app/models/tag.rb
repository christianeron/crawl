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
end
