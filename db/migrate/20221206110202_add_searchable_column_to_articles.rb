class AddSearchableColumnToArticles < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE articles
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
        setweight(to_tsvector('english', coalesce(content,'')), 'B')
      ) STORED;
    SQL
  end
end
