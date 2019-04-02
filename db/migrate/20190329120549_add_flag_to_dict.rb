class AddFlagToDict < ActiveRecord::Migration[5.1]
  def change
    add_column :sso_departments, :department_type, :integer, :default => 0
    add_column :sso_departments, :available, :boolean, :default => true

    add_column :sso_grades, :weight, :integer, :default => 0
  end
end
