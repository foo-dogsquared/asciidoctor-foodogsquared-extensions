# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have a more semantic paragraph output' do
    input = <<~INPUT
      Hello there, fanciful!
    INPUT

    expected = <<~HTML
      <p>Hello there, fanciful!</p>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should still have a more semantic paragraph output with a title' do
    input = <<~INPUT
      .Whoa there!
      Hello there, fanciful!
    INPUT

    expected = <<~HTML
      <p><strong class="title">Whoa there!</strong>Hello there, fanciful!</p>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
