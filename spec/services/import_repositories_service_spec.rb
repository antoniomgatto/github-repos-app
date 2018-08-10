require 'rails_helper'

RSpec.describe ImportRepositoriesService do

  let(:repositories) { Array.new(10, Repository.new(owner: Owner.new, created_at: Time.now, updated_at: Time.now) ) }

  subject(:service) do
    ImportRepositoriesService.new({repositories: repositories}).perform
  end

  it 'import all repositories into database' do
    expect(service).to eq true
    expect(Owner.count).to eq repositories.size
    expect(Repository.count).to eq repositories.size
  end
end