class AddColumnsToSearch < ActiveRecord::Migration[7.0]
  def change
    add_column :searches, :term , :string
    add_column :searches, :count, :integer, default: 0
    add_column :searches, :article_count, :integer, default: 0
    add_column :searches, :zero_article_count, :integer, default: 0
  end
end
