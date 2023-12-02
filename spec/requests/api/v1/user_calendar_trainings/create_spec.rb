# frozen_string_literal: true

describe 'POST api/v1/user_calendar_trainings' do
  subject { post api_v1_user_calendar_trainings_path, params:, headers: auth_headers, as: :json }

  let(:user) { create(:user) }
  let(:training) { create(:training) }
  let(:training_id) { training.id }

  let(:params) do
    {
      user_calendar_training: {
        training_id: training_id,
        user_id: user.id,
        training_datetime: DateTime.now
      }
    }
  end

  let(:user_calendar_training) {
    UserCalendarTraining.last
  }

  it_behaves_like 'check authenticity token in headers'

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the user_calendar_training' do
    expect { subject }.to change(UserCalendarTraining, :count).by(1)
  end
  it 'returns the user_calendar_training data', :aggregate_failures do
    subject
    expect(json[:data][:id]).to eq(user_calendar_training.id.to_s)
    expect(json[:data][:relationships][:training][:data][:id]).to eq(user_calendar_training.training.id.to_s)
    expect(json[:data][:relationships][:user][:data][:id]).to eq(user_calendar_training.user.id.to_s)
  end

  context 'when the user_calendar_training.training id is not correct' do
    let(:training_id) { 100500 }

    it 'does not create a training' do
      expect { subject }.not_to change(UserCalendarTraining, :count)
    end

    it 'does not return a successful response' do
      subject
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
