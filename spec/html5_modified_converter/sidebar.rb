# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have a more semantic sidebar block' do
    input = <<~INPUT
      ****
      A sidebar is used for auxiliary bits of content.
      ****
    INPUT

    expected = <<~HTML
      <aside><p>A sidebar is used for auxiliary bits of content.</p></aside>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a more semantic sidebar block with a title' do
    input = <<~INPUT
      .A sidebar title
      ****
      A sidebar is used for auxiliary bits of content.
      ****
    INPUT

    expected = <<~HTML
      <aside><strong class="title">A sidebar title</strong><p>A sidebar is used for auxiliary bits of content.</p></aside>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a more semantic sidebar block with a title, an ID, and several roles' do
    input = <<~INPUT
      [#sidebar-id.several.roles]
      .A sidebar title
      ****
      A sidebar is used for auxiliary bits of content.
      ****
    INPUT

    expected = <<~HTML
      <aside id="sidebar-id" class="several roles"><strong class="title">A sidebar title</strong><p>A sidebar is used for auxiliary bits of content.</p></aside>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
