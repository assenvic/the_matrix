RSpec.describe V1::Entities::RouteEntity do
  let(:route) { create(:route) }
  let(:route_entity) { JSON.parse(V1::Entities::RouteEntity.represent(route).to_json).deep_symbolize_keys }

  it 'ensures the required values of exposures' do
    expect(route_entity[:passphrase]).to eq route.passphrase
    expect(route_entity[:start_node]).to eq route.start_node
    expect(route_entity[:end_node]).to eq route.end_node
    expect(route_entity[:start_time]).to eq route.start_time.strftime('%Y-%m-%dT%H:%M:%S')
    expect(route_entity[:end_time]).to eq route.end_time.strftime('%Y-%m-%dT%H:%M:%S')
  end
end