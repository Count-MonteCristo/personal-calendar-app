class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date_time
      t.string :location
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
