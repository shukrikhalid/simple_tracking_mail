class AddColumnToStaff < ActiveRecord::Migration[5.2]
  def change
  	change_table :staffs do |t|
  	  t.string :email
  	  t.string :password_digest
  	end
  end
end
