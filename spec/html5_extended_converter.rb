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
