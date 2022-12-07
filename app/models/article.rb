class Article < ApplicationRecord
    include PgSearch::Model
    validates :title, presence: true, length: { minimum: 5, maximum: 100 }
    validates :content, presence: true, length: { minimum: 10 }
    pg_search_scope :search_article,against: { title: 'A', content: 'B' }, using: { tsearch: { dictionary: 'english', tsvector_column: 'searchable' } }
end
