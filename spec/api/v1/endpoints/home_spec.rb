describe V1::Endpoints::Home do
    it 'Home path is working' do
      get '/api/home', params: {}
      expect(response).to be_successful
    end
end
