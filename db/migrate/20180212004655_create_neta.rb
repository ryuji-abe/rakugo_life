class CreateNeta < ActiveRecord::Migration[5.1]
  def change
    create_table :neta do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
