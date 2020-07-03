class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.date :date
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
