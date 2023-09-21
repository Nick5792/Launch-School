def valid_number?(num)
  if /^-?\d+$/.match(num.to_s) && num.to_f > 0
    num.to_i
  elsif /^-?\d*\.?\d+$/.match(num.to_s) && num.to_f > 0
    num.to_f
  else
    puts "Please enter a valid number"
  end
end

loop do
  puts "=> Welcome to the Car Loan Calculator!"
  loan_amount = ''
  apr = ''
  loan_years = ''

  loop do
    puts "=> Please enter your loan amount: "
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = valid_number?(loan_amount)
      break
    end
  end
  
  loop do
    puts "=> Please enter your Annual Percentage Rate (APR): "
    apr = gets.chomp
    if valid_number?(apr)
      apr = valid_number?(apr)
      break
    end
  end

  loop do
    puts "=> Please enter the loan duration in years: "
    loan_years = gets.chomp
    if valid_number?(loan_years)
      loan_years = valid_number?(loan_years)
      break
    end
  end

  apr1 = apr.to_f / 100
  monthly_interest_rate = (apr1 / 12).to_f
  loan_duration = (loan_years * 12)

  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration)))

  puts monthly_payment.to_f.round(2)

  p "=> Would you like to calculate again?"

  input = gets.chomp.downcase
  if input == 'no'
    puts "Goodbye!"
    break
  end
end
