class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
		t.text :name
		t.text :autor
		t.text :genre
		t.integer :year
		t.integer :user_id
      t.timestamps
    end
  end
end
