# frozen_string_literal: true

class String
  def to_kebab
    self.gsub(/\s+/, '-')           # Replace all spaces with dashes.
        .gsub(/[^a-zA-Z0-9-]/, '')  # Remove all non-alphanumerical (and dashes) characters.
        .gsub(/-+/, '-')            # Reduce all dashes into only one.
        .gsub(/^-|-+$/, '')         # Remove all leading and trailing dashes.
        .downcase
  end
end

# The namespace for storing Asciidoctor. This is the entry point for the
# entirety of this project.
module Asciidoctor::Foodogsquared
  NAME = 'asciidoctor-foodogsquared-custom-extensions'
  VERSION = '1.3.0'
  CONTACT_EMAIL = 'foodogsquared@foodogsquared.one'
  USER_AGENT = "#{NAME}/#{VERSION} ( #{CONTACT_EMAIL} )".freeze

  def warn_or_raise(doc, warning)
    return raise warning if (doc.safe > Asciidoctor::SafeMode::SERVER) && !(doc.attr? 'allow-uri-read')

    warn warning
  end
end
