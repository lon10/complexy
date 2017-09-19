describe Complexy::Services::ActivityUpdater do
  let!(:user) { FactoryGirl.create(:user) }

  let(:service) { described_class.new(user.first_name, user.last_name) }

  describe '#increment_coords' do
    let!(:activities) do
      5.times.collect do
        Complexy::Storage::UserActivity.create(user_id: user.id,
                                               action: 'Sawed wood',
                                               lat: 1,
                                               long: 2,
                                               created_at: Time.now
        )
      end
    end

    it 'should update all coords' do
      service.increment_coords

	  Complexy::Storage::UserActivity.where(user_id: user.id).each do |activity|
  	    expect(activity.lat).to eq(2)
  	    expect(activity.long).to eq(3)
	  end
    end
  end

  describe '#rewrite_action' do
    let(:new_action) { 'milked a cow' }

    it "should update all user's actions" do
      service.rewrite_action(new_action)

      Complexy::Storage::UserActivity.where(user_id: user.id).each do |activity|
  	    expect(activity.action).to eq(new_action)
	  end
	end
  end

end
