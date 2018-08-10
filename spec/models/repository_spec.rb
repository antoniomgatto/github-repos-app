require 'rails_helper'

RSpec.describe Repository, :type => :model do
  subject { build(:repository) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a owner" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:owner) }
  end

  describe "#order_by_more_stars" do
    it "order by highest number of stars" do
      repositories = []
      repositories << create(:repository, stargazers_count: 20)
      repositories << create(:repository, stargazers_count: 100)
      repositories << create(:repository, stargazers_count: 0)

      assert_equal repositories[1].stargazers_count, Repository.order_by_more_stars.first.stargazers_count
    end
  end
end