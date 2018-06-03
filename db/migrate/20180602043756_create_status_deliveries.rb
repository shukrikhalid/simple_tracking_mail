class CreateStatusDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :status_deliveries do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
