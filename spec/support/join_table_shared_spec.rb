require 'rails_helper'

RSpec.shared_examples 'join table' do |table1, table2|
  it { is_expected.to belong_to(table1) }
  it { is_expected.to belong_to(table2) }
  it { is_expected.to validate_presence_of(table1) }
  it { is_expected.to validate_presence_of(table2) }
end
