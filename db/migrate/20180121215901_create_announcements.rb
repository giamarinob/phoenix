class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
    	t.string :title, null: :false, default: 'Announcements'
    	t.text :announcements, null: :false, default: 'There are no announcements.'

    	t.timestamps
    end
  end
end