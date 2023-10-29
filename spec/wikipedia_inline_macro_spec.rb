# frozen_string_literal: true

describe WikipediaInlineMacro do
  it 'should link to the Wikipedia page for Diff' do
    input = 'wikipedia:Diff[]'

    expected = <<~RESULT
      <a href="https://en.wikipedia.org/wiki/Diff">Diff</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Japanese Wikipedia page for Diff' do
    input = 'wikipedia:Diff[lang=ja]'

    expected = <<~RESULT
      <a href="https://ja.wikipedia.org/wiki/Diff">Diff</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Japanese Wikipedia page for Diff but with replaced captions' do
    input = 'wikipedia:Diff[diff in Japanese Wikipedia, lang=ja]'

    expected = <<~RESULT
      <a href="https://ja.wikipedia.org/wiki/Diff">diff in Japanese Wikipedia</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Simple English Wikipedia page for photosynthesis' do
    input = 'wikipedia:Photosynthesis[lang=simple]'

    expected = <<~RESULT
      <a href="https://simple.wikipedia.org/wiki/Photosynthesis">Photosynthesis</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
