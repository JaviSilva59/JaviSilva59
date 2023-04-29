using System;

namespace Project_1
{
    class Program
    {
        
        
            int ply1 = 0;
            int ply2 = 0;
            void Logic()
            {
                Console.WriteLine("");

                if (ply1 == ply2)
                    Console.WriteLine("TIE!");

                else if ((ply1 == 49) && (ply2 == 51) || (ply2 == 49) && (ply1 == 51))
                {
                    Console.WriteLine("Scissors cuts Paper!");
                    Console.WriteLine((ply1 == 49 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 50) && (ply2 == 52) || (ply2 == 50) && (ply1 == 52))
                {
                    Console.WriteLine("Rock crushes Lizard!");
                    Console.WriteLine((ply1 == 50 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 51) && (ply2 == 50) || (ply2 == 51) && (ply1 == 50))
                {
                    Console.WriteLine("Paper covers Rock!");
                    Console.WriteLine((ply1 == 51 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 52) && (ply2 == 53) || (ply2 == 52) && (ply1 == 53))
                {
                    Console.WriteLine("Lizard poisons Spock!");
                    Console.WriteLine((ply1 == 52 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 53) && (ply2 == 49) || (ply2 == 53) && (ply1 == 49))
                {
                    Console.WriteLine("Spock smashes Scissors!");
                    Console.WriteLine((ply1 == 53 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 49) && (ply2 == 52) || (ply2 == 49) && (ply1 == 52))
                {
                    Console.WriteLine("Scissors decapitates Lizard!");
                    Console.WriteLine((ply1 == 49 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 52) && (ply2 == 51) || (ply2 == 52) && (ply1 == 51))
                {
                    Console.WriteLine("Lizard eats Paper!");
                    Console.WriteLine((ply1 == 52 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 51) && (ply2 == 53) || (ply2 == 51) && (ply1 == 53))
                {
                    Console.WriteLine("Paper disproves Spock!");
                    Console.WriteLine((ply1 == 51 ? "First" : "Second") + " player wins!");
                }


                else if ((ply1 == 53) && (ply2 == 50) || (ply2 == 53) && (ply1 == 50))
                {
                    Console.WriteLine("Spock vaporizes Rock!");
                    Console.WriteLine((ply1 == 53 ? "First" : "Second") + " player wins!");
                }

                else if ((ply1 == 50) && (ply2 == 49) || (ply2 == 50) && (ply1 == 49))
                {
                    Console.WriteLine("Rock crushes Sciss?s!");
                    Console.WriteLine((ply1 == 50 ? "First" : "Second") + " player wins!");
                }
            }

            int input(int p)
            {
                Console.WriteLine(("1 = scissors, 2 = rock, 3 = paper, 4 = lizard, 5 = spock"));
                Console.WriteLine(((p == 0) ? "First" : "Second") + " player enter your selection!");
                Console.WriteLine("Enter [1 - 5]: ");
                int i = Console.Read();
                return i;
            }

            bool check(int i)
            {
                return ((i > 48) && (i < 54));
            }

            public static void Main(String[] args)
            {
                Program rps = new Program();
                while (rps.ply1 == 0)
                {
                    int i = rps.input(0);
                    if (rps.check(i))
                        rps.ply1 = i;
                    continue;
                }
                while (rps.ply2 == 0)
                {
                    int i = rps.input(1);
                    if (rps.check(i))
                        rps.ply2 = i;
                    continue;
                }
                rps.Logic();
            }
        }
    }

    

