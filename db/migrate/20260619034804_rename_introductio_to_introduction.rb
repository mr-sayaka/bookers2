class RenameIntroductioToIntroduction < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :introduction, :string
  end
end
