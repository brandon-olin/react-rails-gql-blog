class AddKarmaToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :karma, :integer
    add_column :subcomments, :karma, :integer
  end
end
