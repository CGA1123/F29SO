RSpec.shared_examples 'no permission' do
  # rubocop:disable RSpec/ExampleLength, Style/BlockDelimiters
  it 'throws 404' do
    expect {
      if req[:xhr].present?
        send(:xhr, req[:method], req[:action], req[:params])
      else
        send(req[:method], req[:action], req[:params])
      end
    }.to raise_error(ActionController::RoutingError)
  end
  # rubocop:enable RSpec/ExampleLength, Style/BlockDelimiters
end
