# frozen_string_literal: true

describe 'POST api/v1/programs' do
  subject { post api_v1_programs_path, params:, headers: auth_headers, as: :json }

  let(:program) { Program.last }
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  let(:params) do
    {
      program: {
        title: 'test',
        description: 'description',
        user_id: user_id
      }
    }
  end

  it_behaves_like 'check authenticity token in headers'

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the program' do
    expect { subject }.to change(Program, :count).by(1)
  end
  it 'returns the program data', :aggregate_failures do
    subject
    expect(json[:data][:id]).to eq(program.id.to_s)
    expect(json[:data][:attributes][:title]).to eq(program.title)
    expect(json[:data][:attributes][:description]).to eq(program.description)
    expect(json[:data][:relationships][:user][:data][:id]).to eq(user_id.to_s)
  end

  context 'when the user_id is not correct' do
    let(:user_id) { 100500 }

    it 'does not create a program' do
      expect { subject }.not_to change(Program, :count)
    end

    it 'does not return a successful response' do
      subject
      expect(response).to have_http_status(:unsupported_media_type)
    end
  end

end
