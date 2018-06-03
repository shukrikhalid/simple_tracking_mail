class CreateMailHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_histories do |t|
      t.references :mail, foreign_key: true
      t.references :staff, foreign_key: true
      t.references :status_delivery, foreign_key: true

      t.timestamps
    end
  end
end
