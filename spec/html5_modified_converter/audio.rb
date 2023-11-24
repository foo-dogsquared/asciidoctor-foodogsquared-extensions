# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have an audio block with multiple <source>' do
    input = <<~INPUT
      audio::hello.mp3[sources="hello.mp3,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure>
        <audio><source src="hello.mp3" type="audio/mpeg"><source src="hello.webm" type="audio/webm"><p>Download the audio at <a href="hello.mp3">hello.mp3</a>, <a href="hello.webm">hello.webm</a>.</p></audio>
      </figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an audio block with multiple <source> and a caption' do
    input = <<~INPUT
      .Making up stuff right now
      audio::./hello.mp3[sources="hello.mp3,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure>
        <audio><source src="hello.mp3" type="audio/mpeg"><source src="hello.webm" type="audio/webm"><p>Download the audio at <a href="hello.mp3">hello.mp3</a>, <a href="hello.webm">hello.webm</a>.</p></audio>
      <figcaption>Making up stuff right now</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have an audio element with a caption, ID, and classes' do
    input = <<~INPUT
      [#audio-sample.reverse]
      .Making up stuff right now
      audio::./hello.mp3[sources="hello.mp3,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure id="audio-sample" class="reverse">
        <audio><source src="hello.mp3" type="audio/mpeg"><source src="hello.webm" type="audio/webm"><p>Download the audio at <a href="hello.mp3">hello.mp3</a>, <a href="hello.webm">hello.webm</a>.</p></audio>
      <figcaption>Making up stuff right now</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
