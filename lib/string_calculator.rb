class StringCalculator

  def addition(numbers)
    begin
      raise 'input can be string only' unless numbers.is_a?(String)

      integer_array = numbers.scan(/[0-9-]+/).map(&:to_i)

      if negative_numbers = check_for_negatives(integer_array)
        raise "negative input values #{negative_numbers}"
      end
      
      p integer_array.sum #output
    rescue Exception => e
      p "Error- #{e.message}"
    end
  end

  def check_for_negatives(integer_array)
    negatives_array = integer_array.select{ |i| i<0 }

    negatives_array.join(",") if !negatives_array.empty?
  end

end


