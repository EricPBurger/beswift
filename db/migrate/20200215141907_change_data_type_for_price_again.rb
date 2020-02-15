class ChangeDataTypeForPriceAgain < ActiveRecord::Migration[5.2]
  def change
    change_column :costumes, :price, :float
  end
end
