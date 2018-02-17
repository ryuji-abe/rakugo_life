class AddColumnsToUsers3 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :year_of_experience, :integer
  end
end
