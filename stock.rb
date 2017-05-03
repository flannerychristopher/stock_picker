def stock_picker(input)
  buy_date = 0
  buy_price = 0
  sell_price = 0
  sell_date = 1
  stock_prices = []
  input_split = input.split(/[\s?,?]+/)

  input_split.each do |price|
    stock_prices.push(price.to_i)
  end

  for i in 0..(stock_prices.length-1)
    for j in 1..(stock_prices.length-1)
      if (stock_prices[j] - stock_prices[i]) > (sell_price - buy_price) && i < j
        buy_date = i + 1
        sell_date = j + 1
        buy_price = stock_prices[i]
        sell_price = stock_prices[j]
      end
    end
  end

  pair = [buy_date, sell_date]
  profit = sell_price - buy_price
  puts "Buy on day #{buy_date} and sell on day #{sell_date} for a $#{profit} profit"
  return pair

end

puts "what are the stock prices?"
input = gets.chomp
stock_picker(input)
