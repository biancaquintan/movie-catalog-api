require 'rails_helper' 

describe Movie do 
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_length_of(:description).is_at_most(500) }
  end
end