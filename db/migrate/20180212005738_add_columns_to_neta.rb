class AddColumnsToNeta < ActiveRecord::Migration[5.1]
  def change
    add_column :neta, :neta_name, :string
    add_column :neta, :source, :text
    add_column :neta, :impression, :text
  end
end
