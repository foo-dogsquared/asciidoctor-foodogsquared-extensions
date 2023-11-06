# frozen_string_literal: true

module Asciidoctor::Foodogsquared::Extensions
  class ManInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
    use_dsl

    named :man
    name_positional_attributes 'volnum'
    default_attributes 'service' => 'debian', 'subpath' => ''

    def process(parent, target, attrs)
      doc = parent.document
      manname = target

      text = %(#{manname}(#{attrs['volnum']}))

      if doc.basebackend? 'html'
        domain = case attrs['service']
                 when 'debian'
                   'https://manpages.debian.org'
                 when 'ubuntu'
                   'https://manpages.ubuntu.org'
                 when 'arch'
                   'https://man.archlinux.org/man'
                 when 'opensuse'
                   'https://manpages.opensuse.org'
                 when 'voidlinux'
                   'https://man.voidlinux.org'
                 when 'openbsd'
                   'https://man.openbsd.org'
                 when 'none'
                   nil
                 else
                   raise "no available manpage service #{attrs['service']}"
                 end

        if !domain.nil?
          target = %(#{domain}/#{attrs['subpath'].delete_prefix '/'}#{manname}.#{attrs['volnum']})
          doc.register :links, target
          node = create_anchor parent, text, type: :link, target: target
        else
          node = create_inline parent, :quoted, text
        end
      elsif doc.backend == 'manpage'
        node = create_inline parent, :quoted, text, type: :strong
      else
        node = create_inline parent, :quoted, text
      end

      node
    end
  end
end
