class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :staff_no
      t.string :name
      t.string :phone_no
      t.boolean :is_admin
      t.references :position
      t.references :department
      t.timestamps
    end
  end
end
