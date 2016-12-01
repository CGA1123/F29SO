# This shared example takes a HTTP method, an action, and associated params
# performs the request and ensures that it redirects to the login page
RSpec.shared_examples 'unauthenticated request' do |request|
  it 'redirects to login page' do
    send(request[:method], request[:action], request[:params])
    expect(response).to redirect_to(new_user_session_path)
  end
end
