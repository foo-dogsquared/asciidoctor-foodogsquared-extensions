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
      <div role="figure" class="dialogblock dialogblock__box dialogblock__avatar--foodogsquared ">
        <div class="dialogblock dialogblock__avatar">
      <div class="imageblock">
      <div class="content">
      <img src="foodogsquared/default.avif" alt="foodogsquared">
      </div>
      </div>
      </div>
      <div class="dialogblock dialogblock__text">
        <small class="dialogblock dialogblock__avatar-name">foodogsquared</small>
      <div class="paragraph">
      <p>Hello there!</p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to eq expected.chomp
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
      <div role="figure" class="dialogblock dialogblock__box dialogblock__avatar--foodogsquared ">
        <div class="dialogblock dialogblock__avatar">
      <div class="imageblock">
      <div class="content">
      <img src="/avatars/foodogsquared/default.webp" alt="foodogsquared">
      </div>
      </div>
      </div>
      <div class="dialogblock dialogblock__text">
        <small class="dialogblock dialogblock__avatar-name">foodogsquared</small>
      <div class="paragraph">
      <p>Hello there!</p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to eq expected.chomp
  end

  it 'should create a basic chat block with non-default values' do
    input = <<~INPUT
      :avatarsdir: /avatars
      :avatarstype: webp

      [chat, foodogsquared, state=nervous, role=shake]
      ====
      Hello there!
      ====
    INPUT

    expected = <<~RESULT
      <div role="figure" class="dialogblock dialogblock__box dialogblock__avatar--foodogsquared shake">
        <div class="dialogblock dialogblock__avatar">
      <div class="imageblock">
      <div class="content">
      <img src="/avatars/foodogsquared/nervous.webp" alt="foodogsquared">
      </div>
      </div>
      </div>
      <div class="dialogblock dialogblock__text">
        <small class="dialogblock dialogblock__avatar-name">foodogsquared</small>
      <div class="paragraph">
      <p>Hello there!</p>
      </div>
        </div>
      </div>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to eq expected.chomp
  end
end
