require 'rails_helper'

RSpec.describe User, type: :model do
  # things to test for our model unit test:
    # validations
    # associations
    # public methods (NOT private methods)

  # shoulda matchers actually try to create invalid users, so we don't need users already in the database to test these
  #validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }


  #associations
  it { should have_many(:twists) }


  # but for uniquness validations, there does need to be something in the DB to check against
  describe 'uniqueness' do
    before :each do
      create :user # use Factorybot to create a user
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe '#is_password?' do
    let(:user) { create :user } # the bang! creates the user immediately at this line. w/o the bang! it won't be created until referenced
    # in most cases it won't make a difference

    context 'with valid password' do
      it 'should return true' do
        expect(user.is_password?("starwars")).to be true
        # because we used factorybot to create the user, we know it's starwars because that's how we defined it
      end
    end

    context 'with invalid password' do
      it 'should return false' do
        expect(user.is_password?("bananaman")).to be false
      end
    end

  end



end
