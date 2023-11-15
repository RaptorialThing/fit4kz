# frozen_string_literal: true

describe 'GET api/v1/programs' do
  subject { get api_v1_programs_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) do |user|
    user.programs.create({
      title: "test title",
      description: "test description"
    })
  end
  }
  let(:program) {user.programs.last}

  it_behaves_like 'there must not be a Set-Cookie in Header'

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it "returns the program data" do
    subject
    expect(json[:data][0][:id]).to eq(program.id.to_s)
  end

end
