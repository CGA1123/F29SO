# This shared example takes a HTTP method, an action, and associated params
# performs the request and ensures that it redirects to the login page
RSpec.shared_examples 'unauthenticated request' do
  before do
    if req[:xhr].present?
      send(:xhr, req[:method], req[:action], req[:params])
    else
      send(req[:method], req[:action], req[:params])
    end
  end

  it 'redirects to login page' do
    expect(response).to redirect_to(new_user_session_path)
  end
end
