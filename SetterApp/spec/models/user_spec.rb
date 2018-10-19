require 'rails_helper'

RSpec.describe User, type: :model do
  #validations
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(6)}

  #associations
  # it {should have_many(:goals)}

  #uniqueness
  describe 'uniqueness' do
    before :each do
      create :user
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe 'find_by_credentials' do

    context 'if user is in database' do
      let!(:user1) {User.create!(username: 'Harry Potter', password: 'hogwarts')}

      it 'should return the user' do
        expect(User.find_by_credentials('Harry Potter', 'hogwarts')).to eq(user1)
      end
    end

    context 'if user is not in the database' do
      it 'should return nil' do
          expect(User.find_by_credentials('Harry Potter', 'hogwarts')).to be nil
      end
    end
  end

  describe '#is_password?' do
    let!(:user) {create :user}
    context 'with valid password' do

      it 'should return true' do
        expect(user.is_password?('hogwarts')).to be true
      end
    end

    context 'with invalid password' do
      it 'should return false' do
        expect(user.is_password?('starwars')).to be false
      end
    end
  end



end
