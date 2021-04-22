class RemoveKarmaFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :karma, :integer
    remove_column :subcomments, :karma, :integer
  end
end
