RSpec.shared_examples 'join table' do |table1, table2|
  let(:table1_id) { (table1.to_s + '_id').to_sym }
  let(:table2_id) { (table2.to_s + '_id').to_sym }
  it { is_expected.to belong_to(table1) }
  it { is_expected.to belong_to(table2) }
  it { is_expected.to validate_presence_of(table1) }
  it { is_expected.to validate_presence_of(table2) }
  it { is_expected.to validate_uniqueness_of(table1_id).scoped_to(table2_id) }
end
