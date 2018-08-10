require 'rails_helper'

RSpec.describe Owner, :type => :model do
  subject { build(:owner) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  describe "Associations" do
    it { should have_one(:repository) }
  end
end