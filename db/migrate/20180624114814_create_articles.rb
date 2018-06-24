class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :title
      t.string :picture

      t.timestamps
    end
      add_index :articles, [:user_id, :created_at]
  end
end
