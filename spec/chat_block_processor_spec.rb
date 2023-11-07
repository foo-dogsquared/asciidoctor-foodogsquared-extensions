# frozen_string_literal: true

describe ChatBlock do
  it 'should create a basic chat block' do
    input = <<~INPUT
      [chat, foodogsquared]
      ====
      Hello there!
      ====
    INPUT

    expected = <<~RESULT
      <div role="figure" class="dialogblock">
        <div class="dialogblock-avatar">
          <img src="foodogsquared/default.avif" alt="foodogsquared">
        </div>
        <div class="dialogblock-text">
          <small>foodogsquared</small>
          <div class="paragraph">
      <p>Hello there!</p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a basic chat block with non-default values with document attributes' do
    input = <<~INPUT
      :avatarsdir: /avatars
      :avatarstype: webp

      [chat, foodogsquared]
      ====
      Hello there!
      ====
    INPUT

    expected = <<~RESULT
      <div role="figure" class="dialogblock">
        <div class="dialogblock-avatar">
          <img src="/avatars/foodogsquared/default.webp" alt="foodogsquared">
        </div>
        <div class="dialogblock-text">
          <small>foodogsquared</small>
          <div class="paragraph">
      <p>Hello there!</p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a basic chat block with non-default values' do
    input = <<~INPUT
      :avatarsdir: /avatars
      :avatarstype: webp

      [chat, foodogsquared, state=nervous, role=shake]
      ====
      Hello there!

      *wow*
      ====
    INPUT

    expected = <<~RESULT
      <div role="figure" class="shake dialogblock">
        <div class="dialogblock-avatar">
          <img src="/avatars/foodogsquared/nervous.webp" alt="foodogsquared">
        </div>
        <div class="dialogblock-text">
          <small>foodogsquared</small>
          <div class="paragraph">
      <p>Hello there!</p>
      </div>
      <div class="paragraph">
      <p><strong>wow</strong></p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
