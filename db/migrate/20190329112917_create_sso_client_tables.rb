class CreateSsoClientTables < ActiveRecord::Migration[5.1]
  def change
    create_table :dict_versions do |t|
      t.string :version
    end

    create_table :sso_departments do |t|
      t.string :name, null: false
      t.integer :parent_id
      t.integer :serial, null: false
      t.timestamps null: false
    end

    create_table :sso_grades do |t|
      t.string :name, null: false
      t.integer :serial, null: false
      t.timestamps null: false
    end

    create_table :sso_user_types do |t|
      t.string :name, null: false
      t.integer :serial, null: false
      t.timestamps null: false
    end

    add_reference :users, :department
    add_reference :users, :grade
    add_reference :users, :user_type
    add_column :users, :sso_id, :integer
  end
end
