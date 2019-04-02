class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      t.boolean :is_mail
      t.boolean :is_message
      t.references :topic, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
