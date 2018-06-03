json.extract! mail, :id, :mail_no, :issue_id, :recipient_id, :created_at, :updated_at
json.url mail_url(mail, format: :json)
