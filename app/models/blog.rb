class Blog
  include DataMapper::Resource
  
  property :id,           Serial
  property :title,        String
  property :description,  Text
  property :author,       String
  property :created_at,   DateTime
  property :updated_at,   DateTime
  
  has n, :posts
end