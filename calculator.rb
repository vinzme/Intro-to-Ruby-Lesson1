# calculator.rb

def str_operation(option,num1,num2,result)
  case option
  when 1
    puts "#{num1} added by #{num2} is equal to #{result}"
  when 2
    puts "#{num1} subtracted by #{num2} is equal to #{result}"
  when 3
    puts "#{num1} multiplied by #{num2} is equal to #{result}"
  when 4
    puts "#{num1} divided by #{num2} is equal to #{result}"
  end  
end


puts "Please enter your first number : "
first_num = gets.chomp

puts "Please enter your second number : "
second_num = gets.chomp

# check if float
if (first_num+second_num).include?('.')
  first_num = first_num.to_f
  second_num = second_num.to_f
else
  first_num = first_num.to_i
  second_num = second_num.to_i
end

puts "Select from 1 to 4 : 1-Add  2-Subtract 3-Multiply 4-Divide"
operation = gets.chomp.to_i

case operation

when 1
  result = first_num + second_num
when 2
  result = first_num - second_num
when 3
  result = first_num * second_num
else
  begin
    result = first_num / second_num
  rescue
    result = "<<Error: Division by Zero>>" 
  end
end

str_operation(operation,first_num,second_num,result)