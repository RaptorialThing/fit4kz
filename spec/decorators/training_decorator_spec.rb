# frozen_string_literal: true

describe TrainingDecorator do
  let(:training) { create(:training) }
  let(:decorated_training) { training.decorate }

  it 'returns same video_link' do
    expect(decorated_training.show_video_link).to eq(training.video_link)
  end
end
