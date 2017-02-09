RSpec.shared_examples 'no permission' do
  it 'throws 404' do
    expect { send(req[:method], req[:action], req[:params]) }
      .to raise_error(ActionController::RoutingError)
  end
end
