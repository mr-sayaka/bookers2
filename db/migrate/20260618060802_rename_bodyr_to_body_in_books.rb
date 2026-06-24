class RenameBodyrToBodyInBooks < ActiveRecord::Migration[8.0]
  def change
    rename_column :books, :bodyr, :body
  end
end
