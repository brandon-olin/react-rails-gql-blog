class CreateSubcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :subcomments do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
