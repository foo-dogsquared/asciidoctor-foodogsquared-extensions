# frozen_string_literal: true

# foodogsquared's custom converter that is an extended version of the built-in
# HTML5 converter. It features custom blocks as well as their preferred output
# for certain blocks.
module Asciidoctor::Foodogsquared::Converter
  class Html5Custom < (Asciidoctor::Converter.for 'html5')
    register_for 'html5'

    def convert_chat(node)
      attributes = []
      attributes << %(id="#{node.id}") if node.id
      attributes << %(class="#{node.role}") if node.role

      avatar_sticker = node.attributes['avatarsticker']
      avatar_uri = node.parent.image_uri avatar_sticker, 'avatarsdir'

      <<~HTML
        <div role="figure" #{attributes.join ' '}>
          <div class="dialogblock-avatar">
            <img src="#{avatar_uri}" alt="#{node.attributes['name']}">
          </div>
          <div class="dialogblock-text">
            <small>#{node.attributes['name']}</small>
            #{node.content}
          </div>
        </div>
      HTML
    end
  end
end
