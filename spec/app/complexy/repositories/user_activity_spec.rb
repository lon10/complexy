describe Complexy::Repositories::UserActivity do
  let(:user_id) { 12345 }

  let!(:user_ctivities) do
    5.times.collect do
      Complexy::Storage::UserActivity.create(user_id: user_id,
                                             action: Complexy::Storage::UserActivity::ACTIVITY_TYPES.sample,
                                             lat: rand(0..90),
                                             long: rand(0..90),
                                             created_at: Time.now
      )
    end
  end

  describe '#find_by_user_id' do
    subject { described_class.new.find_by_user_id(user_id) }

    its(:count) { should eq(user_ctivities.count) }
    its(:first) { should be_kind_of(Complexy::Domain::UserActivity) }
  end

  describe '#create' do
    let(:activity) { user_ctivities.first } 

    subject { described_class.new.create(user_id, activity) }

    it { is_expected.to be_kind_of(Complexy::Domain::UserActivity) }
    its(:user_id) { is_expected.to eq(user_id) }
  end
end
