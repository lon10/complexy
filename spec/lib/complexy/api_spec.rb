describe Complexy::API do
  describe 'GET /api' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'should greet us' do
      get '/api'

      expect(last_response).to be_ok
      expect(last_response.body).to eq({ message: 'Hello, this is complexy service' }.to_json)
    end
  end
end
