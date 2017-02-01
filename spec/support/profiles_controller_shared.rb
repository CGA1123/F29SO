RSpec.shared_examples 'insufficient permission' do
  it 'redirects to #show' do
    expect(response).to redirect_to(profile_path(id: id))
  end

  it 'displays an alert' do
    expect(flash[:alert]).to eq('Nope...')
  end
end

RSpec.shared_examples 'successful update' do
  before do
    patch :update, id: edit_user_id, user: { location_id: location_id }
  end

  it 'updates the profile' do
    expect(User.find(edit_user_id).location_id).to eq(location_id)
  end

  it 'redirects to #show' do
    expect(response).to redirect_to(profile_path(id: edit_user_id))
  end

  it 'does not display an alert' do
    expect(flash[:alert]).to be_nil
  end
end

RSpec.shared_examples 'unsuccessful update' do
  before do
    patch :update, id: edit_user_id, user: { location_id: location_id }
  end

  it 'does not update the profile' do
    expect(User.find(edit_user_id).location_id).not_to eq(location_id)
  end

  include_examples 'insufficient permission' do
    let(:id) { edit_user_id }
  end
end
