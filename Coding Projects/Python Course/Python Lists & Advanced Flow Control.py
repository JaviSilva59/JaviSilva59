import random
import copy

card_deck = [['Ace of Spades', 'King of Spades', \
            'Queen of Spades', 'Jack of Spades', \
            '10 of Spades', '9 of Spades', \
            '8 of Spades', '7 of Spades', \
            '6 of Spades', '5 of Spades', \
            '4 of Spades', '3 of Spades', \
            '2 of Spades'], \
            ['Ace of Diamonds', 'King of Diamonds', \
            'Queen of Diamonds', 'Jack of Diamonds', \
            '10 of Diamonds', '9 of Diamonds', \
            '8 of Diamonds', '7 of Diamonds', \
            '6 of Diamonds', '5 of Diamonds', \
            '4 of Diamonds', '3 of Diamonds', \
            '2 of Diamonds'],\
            ['Ace of Clubs', 'King of Clubs', \
            'Queen of Clubs', 'Jack of Clubs', \
            '10 of Clubs', '9 of Clubs', \
            '8 of Clubs', '7 of Clubs', \
            '6 of Clubs', '5 of Clubs', \
            '4 of Clubs', '3 of Clubs', \
            '2 of Clubs'],\
            ['Ace of Hearts', 'King of Hearts', \
            'Queen of Hearts', 'Jack of Hearts', \
            '10 of Hearts', '9 of Hearts', \
            '8 of Hearts', '7 of Hearts', \
            '6 of Hearts', '5 of Hearts', \
            '4 of Hearts', '3 of Hearts', \
            '2 of Hearts']]

current_deck = copy.deepcopy(card_deck)
#cards_drawn = []

def card_draw():
    while True:
        if(len(current_deck) == 0):
            print('There are no more cards')
            break
        suit = random.randint(0,len(current_deck)-1)
        if (len(current_deck[suit])==0):
            del(current_deck[suit])
            continue
        card = random.randint(0,len(current_deck[suit])-1)
        print(current_deck [suit][card])
        del current_deck[suit][card]
        break

print('The deck has been shuffled')   
while True:    
    number_of_cards_requested = input('\nHow many cards would you like to draw from this deck?  ')
    try:
        int(number_of_cards_requested)
    except:
        print("That isn't a valid integer.  Please try again.")
        continue
    print()
    for i in range(int(number_of_cards_requested)):
        card_draw()
    print('\nHit the enter key to draw again from this deck')
    print('S to shuffle the deck and draw again')
    user_choice = input('Q to quit:  ')
    if user_choice == 'Q':
        break
    elif user_choice == 'S':
        current_deck = copy.deepcopy(card_deck)
        print('\nThe deck has been shuffled')
        continue
    else:
        continue

input('\nThank you for playing.  Hit enter to exit the script.  ')

