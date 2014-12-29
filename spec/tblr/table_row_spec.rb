include Tblr
describe Tblr::Row do

  before do
    headers = ['firstName', 'last_name']
    row = ['First', 'Last']
    @row = Row.new(headers, row)
  end

  describe '#==' do
    it 'should be equal to another' do
      expect(@row).to eq Row.new(%w(firstName last_name), %w(First Last))
    end
  end

  describe '#to_a' do
    it 'should translate row to array' do
      expect(@row.to_a).to eq %w(First Last)
    end
  end

  describe '#missing_methods' do
    it 'should be able to get row data by argument' do
      expect(@row.first_name).to eq 'First'
      expect(@row.last_name).to eq 'Last'
    end

    it 'should raise error if row doesnt contain the header' do
      expect{@row.missing_name}.to raise_error NoMethodError
    end

    it 'should work if value is nil' do
      row = Row.new(%w(firstName last_name), ['First', nil])
      expect( row.last_name).to eq nil
    end
  end

  describe '#data_for_header' do
    it 'should return data from row for specific header' do
      expect( @row.data_for_header('first_name')).to eq 'First'
      expect( @row.data_for_header('last_name')).to eq 'Last'
    end
  end

end
