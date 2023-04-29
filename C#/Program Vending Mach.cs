using System;

namespace Mod._5
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to vending machine.");
            Console.WriteLine("We offer you (s)oda, coo(k)ies, and (c)hips.");
            Console.WriteLine("Please select the product you want to purchase: ");

            string userChoice = Console.ReadLine();

            int balance = 0;
            
            if (userChoice == "s")
            {
                balance = 100;
            }
            else if(userChoice == "k")
            {
                balance = 200;
            }
            else
            {
                balance = 150;
            }

            while (balance >0)
            {
                Console.WriteLine("\nYou still owe " + balance + " cents.");
                Console.WriteLine("Please insert a coin of 5, 10, or 25: ");
                string coin = Console.ReadLine();
                int coinAmount = Convert.ToInt32(coin);


                balance = balance - coinAmount;
            }

            if (balance < 0)
            {
                Console.WriteLine("change: " + (-balance) + " cents. ");
            }
            else if(balance == 0)
            {
                Console.WriteLine("Enjoy your item!");
            }

            Console.WriteLine("\nYou still owe " + balance + " cents.");

            Console.ReadKey();
        }
    }
}
