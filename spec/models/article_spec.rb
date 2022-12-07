require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Search Article' do
    it 'should return results' do
      article = Article.create(title: 'test test test', content: 'lipsum4000 lipsum4000 lipsum4000')
      expect(Article.search_article('test')).to eq([article])
    end

    it "is not valid without a title" do
      article = Article.new(title: nil)
      expect(article).to_not be_valid
    end
  end
end
  
