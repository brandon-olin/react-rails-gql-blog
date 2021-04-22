class CreatePostVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_votes do |t|
      t.integer :value
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
