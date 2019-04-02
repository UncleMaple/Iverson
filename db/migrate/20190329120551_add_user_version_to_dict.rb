class AddUserVersionToDict < ActiveRecord::Migration[5.1]
  def change
    rename_column :dict_versions, :version, :dict_version
    add_column :dict_versions, :user_version, :string
    DictVersion.clear
  end
end
