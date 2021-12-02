class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :original_url
      t.string :code
      t.integer :visitor_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
