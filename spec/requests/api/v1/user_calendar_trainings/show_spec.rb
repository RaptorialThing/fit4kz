# frozen_string_literal: true

describe 'GET api/v1/user_calendar_training/:id' do
  subject { get api_v1_user_calendar_trainings_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) }
  let(:program) { user.programs.create({
    title: "title test",
    description: "description test"
  }) }
  let(:training) {
    program.trainings.create({
        title: 'test',
        description: 'description',
        user_id: user.id,
        video_link: "https://www.youtube.com/"
    })
  }
  let(:user_calendar_training) {
    training.user_calendar_trainings.create({
      user_id: user.id
    })
  }

  it_behaves_like 'there must not be a Set-Cookie in Header'

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it "returns the user_calendar_training data" do
    user_calendar_training
    subject
    expect(json[:data][0][:id]).to eq(user_calendar_training.id.to_s)
    expect(json[:data][0][:relationships][:training][:data][:id]).to eq(user_calendar_training.training.id.to_s)
    expect(json[:data][0][:relationships][:user][:data][:id]).to eq(user_calendar_training.user.id.to_s)
  end

  context 'when record is not found' do
    it 'returns status 404 not found' do
      get "/api/v1/user_calendar_trainings/100500", headers: auth_headers, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
