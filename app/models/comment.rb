class Comment
  include DataMapper::Resource
  
  property :id,        Serial
  property :author,    String,        :required => true, :length => 500
  property :email,     String,        :required => true, :length => 500
  property :website,   String,        :length => 500
  property :comment,   Text,          :required => true, :lazy => false
  timestamps :at 
  
  belongs_to :post
end
