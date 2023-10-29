# frozen_string_literal: true

describe RepologyLinkInlineMacro do
  it 'should link to the Repology page for beets' do
    input = 'repology:beets[]'

    expected = <<~RESULT
      <a href="https://repology.org/project/beets">beets</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Repology page for beets with replaced caption' do
    input = 'repology:beets[beets is widely available in a lot of the system distributions]'

    expected = <<~RESULT
      <a href="https://repology.org/project/beets">beets is widely available in a lot of the system distributions</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
