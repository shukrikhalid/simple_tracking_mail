class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.string :mail_no
      t.references :issue, foreign_key: true
      t.integer :recipient_id

      t.timestamps
    end
  end
end
