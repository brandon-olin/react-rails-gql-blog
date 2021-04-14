class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :comment_karma
      t.integer :post_karma

      t.timestamps
    end
  end
end
