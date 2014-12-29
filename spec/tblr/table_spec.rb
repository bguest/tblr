include Tblr
describe Tblr::Table do

  before do
    headers = ['firstName', 'last_name']
    rows = [
      %w(First Last),
      %w(Fred Flinstone),
      %w(Wilma Flinstone),
    ]
    @table = Table.new(headers, rows)
  end

  describe '#each' do
    it 'should support enumerable module' do
      expect(@table.map(&:firstName)).to eq %w(First Fred Wilma)
    end
  end

  describe '#size' do
    it 'should return number of rows in table' do
      expect(@table.size).to eq 3
    end
  end

  describe '#[idx]' do
    it 'should return idx row' do
      expect(@table[0]).to eq Row.new(%w(firstName last_name), %w(First Last) )
      expect(@table[1]).to eq Row.new(%w(firstName last_name), %w(Fred Flinstone) )
    end
  end

  describe '#group_by' do
    it 'should return an array of tables' do
      expected = {
        'Last' => Table.new(%w(firstName last_name), [%w(First Last)]),
        'Flinstone' => Table.new(%w(firstName last_name), [
          %w(Fred Flinstone), %w(Wilma Flinstone)
        ])
      }
      expect(@table.group_by(&:last_name)).to eq expected
    end
  end

end
