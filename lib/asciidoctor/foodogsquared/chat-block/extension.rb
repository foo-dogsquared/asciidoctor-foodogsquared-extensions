# frozen_string_literal: true

module Asciidoctor::Foodogsquared::Extensions
  class ChatBlock < Asciidoctor::Extensions::BlockProcessor
    use_dsl

    named :chat
    on_context :example
    name_positional_attributes 'avatar', 'state'
    default_attributes 'state' => 'default'

    def process(parent, reader, attrs)
      # You can think of this section as a pipeline constructing the HTML
      # component for this block. Specifically, we're building one component that
      # contains two output: the dialog image of our avatar and its content.
      attrs['name'] ||= attrs['avatar']

      block = create_block parent, :pass, nil, attrs, content_model: :compound
      block.add_role('dialogblock')

      block << (create_html_fragment block, <<~HTML
        <div role="figure" class="dialogblock dialogblock__box dialogblock__avatar--#{attrs['avatar']} #{attrs['role']}">
          <div class="dialogblock dialogblock__avatar">
      HTML

               )

      attrs['avatarsdir'] ||= File.expand_path('./avatars', attrs['iconsdir'])
      attrs['avatarstype'] ||= parent.attributes['avatarstype'] || 'avif'

      avatar_sticker = "#{attrs['avatar'].to_kebab}/#{attrs['state'].to_kebab}.#{attrs['avatarstype']}"
      avatar_img_attrs = {
        'target' => parent.image_uri(avatar_sticker, 'avatarsdir'),
        'alt' => attrs['name']
      }
      avatar_imgblock = create_image_block block, avatar_img_attrs

      block << avatar_imgblock
      block << (create_html_fragment block, <<~HTML
        </div>
          <div class="dialogblock dialogblock__text">
            <small class="dialogblock dialogblock__avatar-name">#{attrs['name']}</small>
      HTML
               )

      parse_content block, reader

      block << (create_html_fragment block, <<~HTML
          </div>
        </div>
      HTML
               )

      block
    end

    private

    def create_html_fragment(parent, html, attributes = nil)
      create_block parent, :pass, html, attributes
    end
  end
end
