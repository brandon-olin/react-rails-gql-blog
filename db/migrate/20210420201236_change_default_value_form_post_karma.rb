class ChangeDefaultValueFormPostKarma < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :karma, :integer, :default => 0
  end
end
