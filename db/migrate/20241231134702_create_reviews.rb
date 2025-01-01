class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.float :cleanliness_rating
      t.float :accuracy_rating
      t.float :checkin_rating
      t.float :communication_rating
      t.float :location_rating
      t.float :value_rating
      t.float :final_rating
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
