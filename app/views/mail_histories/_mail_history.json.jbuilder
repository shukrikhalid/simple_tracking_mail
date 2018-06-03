json.extract! mail_history, :id, :mail_id, :staff_id, :status_delivery_id, :created_at, :updated_at
json.url mail_history_url(mail_history, format: :json)
