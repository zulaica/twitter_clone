require "rails_helper"

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should have_many :posts }
end
