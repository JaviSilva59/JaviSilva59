#Javi Silva
import random

SODA_BASE_PRICE = 100
payment = 0
balance = 0

price_variance = random.randint(-3,3) * 5
soda_price = SODA_BASE_PRICE + price_variance

print('Welcome to the soda machine.  You can enter values of 5, 10 or 25 in payment')
soda_type = input('What type of soda would you like? ')
print('The current price of ' + soda_type + " is " + str(soda_price) + ' cents')

while True:
    coin = input('Enter a coin: ')
    payment += int(coin)
    balance = soda_price - payment
    if balance > 0:
        print('You still owe ' + str(balance) + ' cents')
        continue
    elif balance < 0:
        print('You have been refunded ' + (str(abs(balance))) + ' cents.')
        break
    else:
        break
print('Enjoy your ' + soda_type + '!')
        
          
    
