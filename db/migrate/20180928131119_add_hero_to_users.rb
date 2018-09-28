class AddHeroToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hero, :string
  end
end
