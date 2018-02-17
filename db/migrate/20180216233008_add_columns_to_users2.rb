class AddColumnsToUsers2 < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :integer
    add_column :users, :age, :integer
    add_column :users, :favorite_rakugoka, :string
  end
end
