def stock_picker(stocks)
  best_days_to_trade = []
  highest_profit = 0
  stocks.each_with_index do |stock, current_index|
    stocks.each_index do |index|
      if index > current_index
        if stocks[index] - stock > highest_profit
          highest_profit = stocks[index] - stock
          best_days_to_trade = [current_index, index]
        end
      end
    end
  end
  if best_days_to_trade.empty?
    puts 'There was no day to make a profit.'
    return nil
  else
    puts "You should have bought the stock on day #{best_days_to_trade[0] + 1} and sold it on day #{best_days_to_trade[1] + 1}."
    puts "You would have paid $#{stocks[best_days_to_trade[0]]} and sold it for $#{stocks[best_days_to_trade[1]]} for a profit of $#{highest_profit}."
    best_days_to_trade
  end
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([19, 5, 3, 2])

# p stock_picker([17,3,6,9,15,8,6,1,10])
# You should have bought the stock on day 2 and sold it on day 5.
# You would have paid $3 and sold it for $15 for a profit of $12.
# [1, 4]

# p stock_picker([19, 5, 3, 2])
# There was no day to make a profit.
# nil
