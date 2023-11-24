# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have an image block with multiple <source>' do
    input = <<~INPUT
      image::hello.png[sources="hello.avif,hello.webp"]
    INPUT

    expected = <<~HTML
      <figure>
        <picture><source srcset="hello.avif" type="image/avif"><source srcset="hello.webp" type="image/webp"><img src="hello.png" alt="hello"></picture>
      </figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with interactive SVG images' do
    input = <<~INPUT
      image::#{fixtures_file 'hello.svg'}[Interactive, opts=interactive]
    INPUT

    # rubocop:disable Layout/TrailingWhitespace
    expected = <<~HTML
      <figure>
        
      <object type="image/svg+xml" data="#{fixtures_file 'hello.svg'}"></object></figure>
    HTML
    # rubocop:enable Layout/TrailingWhitespace

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with interactive SVG images with a caption' do
    input = <<~INPUT
      :figure-caption!:

      .SVG file
      image::#{fixtures_file 'hello.svg'}[Interactive, opts=interactive]
    INPUT

    # rubocop:disable Layout/TrailingWhitespace
    expected = <<~HTML
      <figure>
        
      <object type="image/svg+xml" data="#{fixtures_file 'hello.svg'}"></object><figcaption>SVG file</figcaption></figure>
    HTML
    # rubocop:enable Layout/TrailingWhitespace

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with inline SVG images' do
    input = <<~INPUT
      image::#{fixtures_file 'hello.svg'}[Inline, opts=inline]
    INPUT

    expected = <<~HTML
      <figure>#{File.read fixtures_file('hello.svg')}
      </figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with inline SVG image with a caption' do
    input = <<~INPUT
      :figure-caption!:

      .Inline SVG file
      image::#{fixtures_file 'hello.svg'}[Inline, opts=inline]
    INPUT

    expected = <<~HTML
      <figure>#{File.read fixtures_file('hello.svg')}<figcaption>Inline SVG file</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with multiple <source> with caption' do
    input = <<~INPUT
      :figure-caption!:

      .A figure caption
      image::hello.png[sources="hello.avif,hello.webp"]
    INPUT

    expected = <<~HTML
      <figure>
        <picture><source srcset="hello.avif" type="image/avif"><source srcset="hello.webp" type="image/webp"><img src="hello.png" alt="hello"></picture>
      <figcaption>A figure caption</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with multiple <source>, a caption, an ID, and multiple roles' do
    input = <<~INPUT
      :figure-caption!:

      [#image-id.whoa.there]
      .A figure caption
      image::hello.png[sources="hello.avif,hello.webp"]
    INPUT

    expected = <<~HTML
      <figure id="image-id" class="whoa there">
        <picture><source srcset="hello.avif" type="image/avif"><source srcset="hello.webp" type="image/webp"><img src="hello.png" alt="hello"></picture>
      <figcaption>A figure caption</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an image block with multiple <source>, a caption, an ID, and multiple roles with some attributes' do
    input = <<~INPUT
      :figure-caption!:

      [#image-id.whoa.there]
      .A figure caption
      image::hello.png[sources="hello.avif,hello.webp", width=300, height=100]
    INPUT

    expected = <<~HTML
      <figure id="image-id" class="whoa there">
        <picture><source srcset="hello.avif" type="image/avif"><source srcset="hello.webp" type="image/webp"><img width="300" height="100" src="hello.png" alt="hello"></picture>
      <figcaption>A figure caption</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
