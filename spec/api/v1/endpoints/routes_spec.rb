describe V1::Endpoints::Routes do
  include_context 'API'
  let(:route_param) { FactoryBot.build(:route).attributes }
  let(:route) { FactoryBot.create(:route) }

  context 'GET /api/routes' do
    it 'a valid passphrase' do
      get '/api/routes', params: { passphrase: route.passphrase }, headers: header
      expect(response).to be_ok
      expect(payload['passphrase']).to eq route.passphrase
    end
    it 'not a valid passphrase' do
      get '/api/routes', params: { passphrase: 'invalid passphrase' }, headers: header
      expect(response).to be_not_found
    end
  end

  context 'POST /api/routes' do
    context 'missing params' do
      [:start_time, :end_time, :start_node, :end_node].each do |param|
        it "returns bad request when #{param} param not found" do
          params = route_param.except(param).to_json
          post '/api/routes', params: params, headers: header
          expect(response).to be_bad_request
        end
      end
    end
  
    it 'creates a route' do
      post '/api/routes', params: route_param, headers: header
      expect(response).to be_created
      expect(payload['passphrase']).not_to be_blank
    end

    it 'fail when start_node not valid param' do
      route_param[:start_node] = 'invalid node'
      post '/api/routes', params: route_param, headers: header
      expect(response).to be_bad_request
    end

    it 'fail when end_node not valid param' do
      route_param[:end_node] = 'invalid node'
      post '/api/routes', params: route_param, headers: header
      expect(response).to be_bad_request
    end

    it 'fail when start_time greater than end_time' do
      route_param[:start_time] = 2.days.from_now
      route_param[:end_time] = 1.day.ago
      post '/api/routes', params: route_param, headers: header
      expect(response).to be_unprocessable
    end
  end
end
