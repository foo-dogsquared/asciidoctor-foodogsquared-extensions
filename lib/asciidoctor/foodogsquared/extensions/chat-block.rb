# frozen_string_literal: true

module Asciidoctor::Foodogsquared::Extensions
  class ChatBlock < Asciidoctor::Extensions::BlockProcessor
    use_dsl

    named :chat
    on_context :example
    name_positional_attributes 'avatar', 'state'
    default_attributes 'state' => 'default'

    def process(parent, _, attrs)
      doc_attrs = parent.document.attributes

      # Configuring the avatar-related attributes.
      attrs['avatarsdir'] ||= doc_attrs['avatarsdir'] || File.expand_path('./avatars', attrs['iconsdir'])
      attrs['avatarstype'] ||= doc_attrs['avatarstype'] || 'avif'
      attrs['avatarsticker'] = attrs['avatar'].to_kebab

      block = create_block parent, :chat, nil, attrs, content_model: :compound
      block.add_role 'dialogblock'

      block
    end
  end
end
