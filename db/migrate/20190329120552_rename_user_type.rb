class RenameUserType < ActiveRecord::Migration[5.1]
  def change
    rename_column :sso_user_types, :name, :title
    add_column :sso_user_types, :zh_title, :string
  end
end
