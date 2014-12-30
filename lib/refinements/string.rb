
module StringRefinements
  refine String do
    def camelize(first_letter = :upper)
      result = self.split("_").map{|s| s.capitalize! }.join("")
      case first_letter
      when :upper; result
      when :lower; result[0].downcase + result[1..-1]
      end
    end
  end
end
