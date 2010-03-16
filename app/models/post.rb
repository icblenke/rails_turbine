class Post
  include DataMapper::Resource
  
  property :id,            Serial
  property :title,         String
  property :body,          Text, :lazy => false
  property :is_published,  Boolean
  property :author,        String
  property :created_at,    DateTime
  property :updated_at,    DateTime
  
  belongs_to :blog
  has n, :comments
end