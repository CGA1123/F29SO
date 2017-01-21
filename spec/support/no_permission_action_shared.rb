RSpec.shared_examples 'no permission' do |request|
  it 'throws 404' do
    expect { send(request[:method], request[:action], request[:params]) }
      .to raise_error(ActionController::RoutingError)
  end
end
