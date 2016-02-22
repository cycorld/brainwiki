module NueronsHelper
  def render_markdown(text)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true, tables: true, link_attributes: {rel: 'nofollow', target: "_blank"})
    doc = Nokogiri::HTML::DocumentFragment.parse(renderer.render(text))
    doc.css('code[@class]').each do |code|
      div = CodeRay.scan(code.text.rstrip, code[:class].to_sym).div
      code = code.replace(div)
      code.first.parent.swap(code.first)
    end
    doc.to_s
  end
end
