class Calculator
    def sum (a,b)
        a + b
    end

    def substract (a,b)
        a - b 
    end
end

calc = Calculator.new
test_sum = {
    [1,2] => 3,
    [5,7] => 12,
    [21,15] =>36
}

test_sum.each do |input, expected_result|
    if calc.sum(input[0],input[1]) != expected_result
        raise "Error en el test, #{input}, valor esperado: #{expected_result}"
    end
end