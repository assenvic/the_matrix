shared_context 'API' do
  let(:thermostat) { create(:thermostat) }
  let(:header) do
    header = {}
    header['Accept'] = 'application/the_matrix-v1+json'
    header
  end
  let(:payload) { JSON.parse(response.body) }
end