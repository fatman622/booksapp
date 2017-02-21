class CreateBookexchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :bookexchanges do |t|
      t.integer :profile_id
      t.integer :book_id

      t.timestamps
    end
  end
end
