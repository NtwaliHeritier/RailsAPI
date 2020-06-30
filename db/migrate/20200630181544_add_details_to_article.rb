class AddDetailsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :title, :string
    add_column :articles, :body, :text
  end
end
