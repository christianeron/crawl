# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  caption    :text
#  photo      :string
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stop_id    :integer
#  user_id    :integer
#
class Visit < ApplicationRecord
end
