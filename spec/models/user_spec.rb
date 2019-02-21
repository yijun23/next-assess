RSpec.describe User, type: :model do

    it 'creates a new user with valid data' do
        expect(User.create!(name: 'aqsgdgf', email: 'test@example.com', password: 'qwertyu')).to be_valid
    end

    it 'creates a new user without name' do
        expect{ User.create!(email: 'test@example.com', password: 'qwertyu') }.to raise_error('Validation failed: First name can\'t be blank')
    end

    it 'creates a new user without password' do
        expect{ User.create!(name: 'qwertayu', email: 'test@example.com') }.to raise_error('Validation failed: Password can\'t be blank, Password is too short (minimum is 7 characters)')
    end

    it 'should have password length more than 6 characters' do
        expect{ User.create!(name: 'aqsgdgf', email: 'test@example.com', password: 'qwerty') }.to raise_error('Validation failed: Password is too short (minimum is 7 characters)')
    end


    it 'should have a unique email' do
        user1 = User.create!(name: 'aqsgdgf', email: 'test@example.com', password: 'qwertyu')
       expect{ User.create!(name: 'aqsgdgf', email: 'test@example.com', password: 'qwertyu') }.to raise_error('Validation failed: Email has already been taken')
     end

     it 'should have a proper email format' do
       expect{ User.create!(name: 'aqsgdgf', email: 'dasd', password: 'qwertyu') }.to raise_error('Validation failed: Email is invalid')
     end

     it 'should have many games' do
       expect(User.reflect_on_association(:games).macro).to eq(:has_many)
     end

   it 'should have many authentications' do
       expect(User.reflect_on_association(:games).macro).to eq(:has_many)
     end
end