class Article < ApplicationRecord
has_many :comments, as: :commentable, dependent: :destroy

def self.pagination_article(page) 
   paginate(page: page, per_page: 1)
end

end
