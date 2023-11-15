# frozen_string_literal: true

describe 'GET api/v1/trainings' do
  subject { get api_v1_trainings_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) do |user|
    user.programs.create({
      title: "test title",
      description: "test description"
    })
  end
  }
  let(:program) {user.programs.last}
  let(:training) {program.trainings.create({
        title: "api training test title",
        description: "api training test description",
        video_link: "https://www.youtube.com/",
        user_id: user.id
  })}

  it_behaves_like 'there must not be a Set-Cookie in Header'

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it "returns the training data" do
    training
    subject
    expect(json[:data][0][:id]).to eq(training.id.to_s)
  end

end
