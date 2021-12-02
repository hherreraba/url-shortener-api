class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.string :ip_address
      t.string :user_agent
      t.date :date_of_visit
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
