# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor-foodogsquared-extensions'

include Asciidoctor::Foodogsquared::Extensions
RSpec.configure do
  def fixtures_dir
    File.join __dir__, 'fixtures'
  end

  def fixtures_file path
    File.join fixtures_dir, path
  end
end
