class Post
  include DataMapper::Resource
  
  property :id,            Serial
  property :title,         String
  property :body,          Text, :lazy => false
  property :is_published,  Boolean
  property :markup_lang,   String
  property :author,        String
  property :created_at,    DateTime
  property :updated_at,    DateTime
  
  belongs_to :blog
  has n, :comments

  def markup_lang
    self.markup_lang=('HTML') if self[:markup_lang].nil? 
    self[:markup_lang]
  end
end