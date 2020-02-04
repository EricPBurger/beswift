class AddSizeToCostumes < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :size, :integer
  end
end
