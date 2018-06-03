class Mail < ApplicationRecord
  belongs_to :issue
  belongs_to :recipient, :class_name => 'Staff'
  has_many :mail_histories
end
