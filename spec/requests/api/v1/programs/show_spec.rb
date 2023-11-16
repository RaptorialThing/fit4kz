# frozen_string_literal: true

describe 'GET api/v1/programs/:id' do
  subject { get api_v1_programs_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) }
  let(:program) { user.programs.create({
    title: "title test",
    description: "description test"
  })
}
  let(:training) {
    program.trainings.create({
        title: 'test',
        description: 'description',
        user_id: user.id,
        video_link: "https://www.youtube.com/"
    })
  }

  it_behaves_like 'there must not be a Set-Cookie in Header'

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it "returns the program data" do
    training
    subject
    expect(json[:data][0][:id]).to eq(program.id.to_s)
    expect(json[:data][0][:attributes][:title]).to eq(program.title)
    expect(json[:data][0][:attributes][:description]).to eq(program.description)
    expect(json[:data][0][:relationships][:trainings][:data][0][:id]).to eq(program.trainings.last.id.to_s)
    expect(json[:data][0][:relationships][:user][:data][:id]).to eq(program.user.id.to_s)
  end

  context 'when record is not found' do
    it 'returns status 404 not found' do
      get "/api/v1/programs/100500", headers: auth_headers, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
