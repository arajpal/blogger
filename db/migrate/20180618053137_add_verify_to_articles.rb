class AddVerifyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :verfied, :boolean
  end
end
