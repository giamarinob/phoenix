class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
    	t.string :month, null: false
    	t.string :year, null: false
    	t.string :calendar_file

    	t.timestamps
    end
  end
end
