# frozen_string_literal: true

RSpec.shared_examples 'check authenticity token in headers' do
  it 'return a Authorization Header' do
    subject
    expect(response.headers.keys).to include('Authorization')
  end
end
