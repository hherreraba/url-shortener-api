class ChangeVisitorColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:links, :visitor_counter, from: nil, to: 0)
  end
end
