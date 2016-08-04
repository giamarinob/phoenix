class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
    	t.string :month, null: false
    	t.string :year, null: false
    	t.string :newsletter_file, null: false

    	t.timestamps
    end
  end
end
