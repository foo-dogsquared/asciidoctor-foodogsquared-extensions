# frozen_string_literal: true

require 'asciidoctor/foodogsquared/converters/html5-extended'

describe Asciidoctor::Foodogsquared::Converters::HTML5Modified do
  it 'should have a video block with multiple <source>' do
    input = <<~INPUT
      video::hello.mp4[sources="hello.mp4,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure>
        <video><source src="hello.mp4" type="video/mp4"><source src="hello.webm" type="video/webm"><p>Download the video at <a href="hello.mp4">hello.mp4</a>, <a href="hello.webm">hello.webm</a>.</p></video>
      </figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a video block with a bunch of attributes' do
    input = <<~INPUT
      video::hello.mp4[opts="autoplay,loop", preload="metadata"]
    INPUT

    expected = <<~HTML
      <figure>
        <video autoplay="autoplay" loop="loop" preload="metadata" src="hello.mp4"><p>Download the video at <a href="hello.mp4">hello.mp4</a>.</p></video>
      </figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a video block with multiple <source> and a caption' do
    input = <<~INPUT
      .Making up stuff right now
      video::./hello.mp4[sources="hello.mp4,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure>
        <video><source src="hello.mp4" type="video/mp4"><source src="hello.webm" type="video/webm"><p>Download the video at <a href="hello.mp4">hello.mp4</a>, <a href="hello.webm">hello.webm</a>.</p></video>
      <figcaption>Making up stuff right now</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end

  it 'should have a video block with a caption, ID, and classes' do
    input = <<~INPUT
      [#video-sample.reverse]
      .Making up stuff right now
      video::./hello.mp4[sources="hello.mp4,hello.webm"]
    INPUT

    expected = <<~HTML
      <figure id="video-sample" class="reverse">
        <video><source src="hello.mp4" type="video/mp4"><source src="hello.webm" type="video/webm"><p>Download the video at <a href="hello.mp4">hello.mp4</a>, <a href="hello.webm">hello.webm</a>.</p></video>
      <figcaption>Making up stuff right now</figcaption></figure>
    HTML

    actual = (Asciidoctor.convert input).chomp
    (expect actual).to eq expected.chomp
  end
end
