class CreatePokes < ActiveRecord::Migration[7.1]
  def change
    create_table :pokes do |t|
      t.string :name
      t.string :first_type
      t.string :second_type

      t.timestamps
    end
  end
end
