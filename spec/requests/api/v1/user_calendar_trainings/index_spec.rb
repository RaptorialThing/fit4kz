# frozen_string_literal: true

describe 'GET api/v1/user_calendar_trainings' do
  subject { get api_v1_user_calendar_trainings_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) do |user|
    user.programs.create({
      title: "test title",
      description: "test description"
    })
  end
  }
  let(:program) {user.programs.last}
  let(:training) {program.trainings.create({
        title: "api user_calendar_training test title",
        description: "api user_calendar_training test description",
        video_link: "https://www.youtube.com/",
        user_id: user.id
  })}
  let(:user_calendar_training) {
    training.user_calendar_trainings.create({
      user_id: user.id,
      training_datetime: DateTime.now
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
  end

end
