class RenameDepartmentToTeam < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :department if column_exists? :users, :department_id
    drop_table :sso_departments if table_exists? :sso_departments

    create_table :sso_teams do |t|
      t.string :name, null: false
      t.integer :parent_id
      t.integer :team_type, :default => 0
      t.integer :serial, null: false
      t.boolean :available, :default => true
      t.timestamps null: false
    end unless table_exists? :sso_teams
    DictVersion.clear
  end
end
