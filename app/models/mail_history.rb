class MailHistory < ApplicationRecord
  belongs_to :mail
  belongs_to :staff
  belongs_to :status_delivery
end
