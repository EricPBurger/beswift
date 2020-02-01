class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.date :payment_date
      t.decimal :amount
      t.integer :days_booked
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
