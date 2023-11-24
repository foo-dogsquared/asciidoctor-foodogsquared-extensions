# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have a more semantic version of the admonitions' do
    input = <<~INPUT
      [WARNING]
      ====
      Hello there
      ====
    INPUT

    expected = <<~HTML
      <aside data-admonition-type="warning"><div class="admonition-label">Warning</div>
      <p>Hello there</p></aside>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a more semantic version of the admonitions even with typical Asciidoc elements' do
    input = <<~INPUT
      [#warning-id.big.reversed]
      .A warning
      [WARNING]
      ====
      Hello there
      ====
    INPUT

    expected = <<~HTML
      <aside data-admonition-type="warning" id="warning-id" class="big reversed"><div class="admonition-label">Warning</div>
      <strong class="title">A warning</strong><p>Hello there</p></aside>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
