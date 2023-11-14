# frozen_string_literal: true

describe 'POST api/v1/trainings' do
  subject { post api_v1_trainings_path, params:, headers: auth_headers, as: :json }

  let(:training) { Training.last }
  let(:user) { create(:user) }
  let(:program) { create(:program) }
  let(:program_id) { program.id }

  let(:params) do
    {
      training: {
        title: 'test',
        description: 'description',
        user_id: user.id,
        program_id: program_id,
        video_link: "https://www.youtube.com/"
      }
    }
  end

  it_behaves_like 'check authenticity token in headers'

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the training' do
    expect { subject }.to change(Training, :count).by(1)
  end
  it 'returns the training data', :aggregate_failures do
    subject #json[:training]
    expect(json[:id]).to eq(training.id)
    expect(json[:title]).to eq(training.title)
    expect(json[:description]).to eq(training.description)
    expect(json[:program_id]).to eq(program.id)
    expect(json[:user_id]).to eq(user.id)
  end

  context 'when the program_id is not correct' do
    let(:program_id) { 100500 }

    it 'does not create a training' do
      expect { subject }.not_to change(Training, :count)
    end

    it 'does not return a successful response' do
      subject
      expect(response).to have_http_status(:unsupported_media_type)
    end
  end

end
