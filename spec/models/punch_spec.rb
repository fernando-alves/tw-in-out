describe Punch do
  describe 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :time }
    it { is_expected.to validate_presence_of :workday }
  end

  describe '.all_by' do
    subject { Punch.all_by(user: user, workday: workday) }
    let(:punch) { create(:punch) }
    let(:user) { punch.user }
    let(:workday) { punch.workday }

    before { punch }

    it { is_expected.to eq [punch] }

    context 'when there is another punch user' do
      let(:another_punch) { create(:punch) }

      before { another_punch }

      it { is_expected.to eq [punch] }
      it { expect(Punch.count).to eq 2 }
    end
  end
end
