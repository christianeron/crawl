# == Schema Information
#
# Table name: stop_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stop_id    :integer
#  user_id    :integer
#
class StopComment < ApplicationRecord
end
