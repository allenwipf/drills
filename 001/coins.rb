require 'pry'
def coins(amount)

   qCount = ((amount / 0.25).floor)
   amount = (amount % 0.25)
binding.pry
   dCount = ((amount / 0.10).floor)
   amount = (amount % 0.10)

   nCount = ((amount / 0.05).floor)
   amount = (amount % 0.05)

   pCount = (amount / 0.01).round

   print "You have #{qCount} quarters, #{dCount} dimes, #{nCount} nickes, and #{pCount} pennies!"

   return amount
   
end


coins(1.46)