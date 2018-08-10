require 'rails_helper'

RSpec.describe ResponseParser do

  before do
    FakeResponse = Struct.new(:items)
  end

  let(:response) {
    FakeResponse.new([
      {
        'node_id' => 'node_id',
        'name' => 'name',
        'stargazers_count' => 1,
        'owner' => {
          'node_id' => 'node_id',
          'login' => 'login'
          }
      }])
  }

  subject(:parser) do
    ResponseParser.new({response: response}).perform
  end

  it 'success on parse response' do
    result = parser
    expect(result.size).to eq 1
    expect(result[0].name).to eq 'name'
    expect(result[0].owner.login).to eq 'login'
  end
end