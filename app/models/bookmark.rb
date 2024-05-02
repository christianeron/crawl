# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  crawl_id   :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord
end
