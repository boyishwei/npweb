class RenameColumnNameOrConfigs < ActiveRecord::Migration
  def up
	rename_column :configs, :desc, :remarks
  end

  def down
	rename_column :configs, :remarks,:desc
  end
end
