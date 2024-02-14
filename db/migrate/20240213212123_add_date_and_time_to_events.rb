class AddDateAndTimeToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    remove_column :events, :date_time, :datetime
  end
end
