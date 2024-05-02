class UpdateRecommendationOnStops < ActiveRecord::Migration[7.0]
  def change
    remove_column :stops, :menu_recommendation
    add_column :stops, :recommendation, :text
  end
end
