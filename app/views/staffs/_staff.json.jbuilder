json.extract! staff, :id, :staff_no, :name, :phone_no, :email, :is_admin, :position_id, :department_id, :created_at, :updated_at
json.url staff_url(staff, format: :json)
