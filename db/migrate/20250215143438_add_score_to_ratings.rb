class AddScoreToRatings < ActiveRecord::Migration[7.2]
  def change
    add_column :ratings, :score, :integer
  end
end
