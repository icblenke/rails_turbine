require 'kramdown'

module PostsHelper
  def render_body(post)
    case post.markup_lang
      when 'HTML'
        raw(post.body)
      when 'MARKDOWN'
        Kramdown::Document.new(post.body).to_html
    end
  end

end
