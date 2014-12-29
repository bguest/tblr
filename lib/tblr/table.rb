module Tblr
  class Table
    include Enumerable

    attr_reader :headers

    def initialize(*args)
      @headers = args[0]
      @rows = args[1]
    end

    def ==(a_table)
      headers == a_table.headers &&
        rows == a_table.rows
    end

    def [](idx)
      Tblr::Row.new(headers, rows[idx])
    end

    def each
      @rows.each_with_index do |row, idx|
        yield(Tblr::Row.new(headers, rows[idx]))
      end
    end

    def group_by(*args, &block)
      hash = self.map{|row| row}.group_by(*args, &block)
      hash.each{|key, data| hash[key] = self.class.new(headers, data.map(&:to_a))}
    end

    def size
      rows.size
    end

    protected

    attr_reader :rows

  end
end
