require 'refinements/string'
using StringRefinements

module Tblr
  class Row

    def initialize(*args)
      @headers = args[0]
      @row = args[1]
    end

    def ==(another_row)
      headers == another_row.headers &&
        row == another_row.row
    end

    def to_a
      row
    end

    def data_for_header(name)
      idx = :nope
      camel = name.camelize(:lower)
      if headers.include?(name)
        idx = headers.index(name)
      elsif headers.include?(camel)
        idx = headers.index(camel)
      end

      idx == :nope ? :nope : row[idx]
    end

    def method_missing(sym, *args, &block)
      data = data_for_header(sym.to_s)
      data == :nope ? super(sym, *args, &block) : data
    end

  protected

    attr_accessor :headers, :row

  end
end
