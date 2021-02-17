class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: {on_delete: :cascade} 
      t.text :tags, null: false

      t.timestamps
    end
  end
end
