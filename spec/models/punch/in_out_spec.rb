describe Punch::InOut do
  describe 'validations' do
    context 'when is completed' do
      it { expect(Punch::InOut.new(punch_in: Punch.new, punch_out: Punch.new)).to be_completed }
    end
    context 'when is incompleted' do
      it { expect(Punch::InOut.new(punch_in: Punch.new)).to_not be_completed }
      it { expect(Punch::InOut.new(punch_out: Punch.new)).to_not be_completed }
      it { expect(Punch::InOut.new({})).to_not be_completed }
    end
  end
  describe 'building In-Out' do
    context 'when has complete punches' do
      context 'when has 2 punches' do
        punches = Given.a_punches_at('09:00', '12:00')
        it 'should create a in outs for each 2 punches' do
          in_outs = Punch::InOut.create_for punches
          in_out = in_outs.first

          expect(Then.an_hour_of(in_out.punch_in.time)).to eq '09:00'
          expect(Then.an_hour_of(in_out.punch_out.time)).to eq '12:00'
        end
      end
      context 'when has 4 punches' do
        punches = Given.a_punches_at('09:00', '12:00', '13:00', '18:00')
        it 'should create a in outs for each 2 punches' do
          in_outs = Punch::InOut.create_for punches

          expect(Then.an_hour_of(in_outs[0].punch_in.time)).to eq '09:00'
          expect(Then.an_hour_of(in_outs[0].punch_out.time)).to eq '12:00'

          expect(Then.an_hour_of(in_outs[1].punch_in.time)).to eq '13:00'
          expect(Then.an_hour_of(in_outs[1].punch_out.time)).to eq '18:00'
        end
      end
    end
    context 'when has incomplete punches' do
      context 'when has 3 punches' do
        punches = Given.a_punches_at('09:00', '12:00', '13:00')
        it 'should create a in outs for each 2 punches' do
          in_outs = Punch::InOut.create_for punches

          expect(Then.an_hour_of(in_outs[0].punch_in.time)).to eq '09:00'
          expect(Then.an_hour_of(in_outs[0].punch_out.time)).to eq '12:00'

          expect(Then.an_hour_of(in_outs[1].punch_in.time)).to eq '13:00'
          expect(in_outs[1].punch_out).to be_nil
        end
      end
      context 'when has one punch' do
        punches = Given.a_punches_at('09:00')
        it 'should create a in outs for each 2 punches' do
          in_outs = Punch::InOut.create_for punches
          in_out = in_outs.first

          expect(Then.an_hour_of(in_out.punch_in.time)).to eq '09:00'
          expect(in_out.punch_out).to be_nil
        end
      end
    end
  end
end
