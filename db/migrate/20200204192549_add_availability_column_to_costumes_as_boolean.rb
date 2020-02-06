class AddAvailabilityColumnToCostumesAsBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :availability, :boolean, default: true
  end
end
