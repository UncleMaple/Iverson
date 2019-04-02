json.extract! subscribe, :id, :is_mail, :is_message, :topic_id, :user_id, :created_at, :updated_at
json.url subscribe_url(subscribe, format: :json)
