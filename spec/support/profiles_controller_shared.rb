RSpec.shared_examples 'insufficient permission' do
  it 'redirects to #show' do
    expect(response).to redirect_to(profile_path(id: id))
  end

  it 'displays an alert' do
    expect(flash[:alert]).to eq('Nope...')
  end
end
