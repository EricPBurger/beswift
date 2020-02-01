class CreateCostumes < ActiveRecord::Migration[5.2]
  def change
    create_table :costumes do |t|
      t.string :costume_name
      t.string :origin
      t.integer :price
      t.string :desc_short
      t.text :desc_long
      t.references :user, foreign_key: true
      t.string :availability

      t.timestamps
    end
  end
end
