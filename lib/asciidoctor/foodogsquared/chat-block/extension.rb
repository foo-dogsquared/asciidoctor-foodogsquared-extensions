# frozen_string_literal: true

module Asciidoctor::Foodogsquared::Extensions
  class ChatBlock < Asciidoctor::Extensions::BlockProcessor
    use_dsl

    named :chat
    on_context :example
    name_positional_attributes 'avatar', 'state'
    default_attributes 'state' => 'default'

    def process(parent, reader, attrs)
      attrs['name'] ||= attrs['avatar']

      # Configuring the avatar-related attributes.
      attrs['avatarsdir'] ||= File.expand_path('./avatars', attrs['iconsdir'])
      attrs['avatarstype'] ||= parent.attributes['avatarstype'] || 'avif'
      attrs['avatarsticker'] = "#{attrs['avatar'].to_kebab}/#{attrs['state'].to_kebab}.#{attrs['avatarstype']}"

      block = create_block parent, :chat, nil, attrs, content_model: :compound
      block.add_role 'dialogblock'

      block
    end
  end
end
