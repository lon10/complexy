describe Complexy::Repositories::User do
  describe '#find' do
    let!(:user) { FactoryGirl.create(:user) }

    subject { described_class.new.find(user.id) }

    it { is_expected.to be_kind_of(Complexy::Domain::User) }
    its(:id) { should eq(user.id) }
    its(:first_name) { should eq(user.first_name) }
    its(:last_name) { should eq(user.last_name) }
  end

  describe '#all' do
    let!(:users) do
      10.times.collect do
        FactoryGirl.create(:user) 
      end
    end

    subject { described_class.new.all }

    it { is_expected.to be_kind_of(Array) }
    its(:first) { is_expected.to be_kind_of(Complexy::Domain::User) }
  end

  describe '#update' do
    let!(:user) { FactoryGirl.create(:user) }
    let(:new_first_name) { 'Omar' }
    let(:new_last_name) { 'Djamal' }

    it "should update user's name" do
      described_class.new.update(user.id, new_first_name, new_last_name)

      updated_user = described_class.new.find(user.id)

      expect(updated_user.first_name).to eq(new_first_name)
      expect(updated_user.last_name).to eq(new_last_name)
    end
  end
end
