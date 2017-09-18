describe Complexy::Repositories::UserActivity do
  let(:user_id) { 12345 }

  describe '#find_by_user_id' do
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

    subject { described_class.new.find_by_user_id(user_id) }

    its(:count) { should eq(user_ctivities.count) }
    its(:first) { should be_kind_of(Complexy::Domain::UserActivity) }
  end

  describe '#create' do
    let(:activity) do 
      Complexy::Domain::UserActivity.new(user_id,
                                         Complexy::Storage::UserActivity::ACTIVITY_TYPES.sample,
                                         rand(0..90),
                                         rand(0..90),
                                         Time.now
      )
    end

    subject { described_class.new.create(user_id, activity) }

    it { is_expected.to be_kind_of(Complexy::Domain::UserActivity) }
    its(:user_id) { is_expected.to eq(user_id) }
  end

  describe '#create_many' do
    let!(:user_ctivities) do
      5.times.collect do
        Complexy::Domain::UserActivity.new(user_id,
                                           Complexy::Storage::UserActivity::ACTIVITY_TYPES.sample,
                                           rand(0..90),
                                           rand(0..90),
                                           Time.now
        )
      end
    end

      subject { Complexy::Storage::UserActivity.count }

      it { is_expected.to eq(user_ctivities.count) }
  end
end
