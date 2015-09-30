describe Workday do
  describe 'validations' do
    it { is_expected.to validate_presence_of :day }
    it { is_expected.to have_many :punches }
  end
end
