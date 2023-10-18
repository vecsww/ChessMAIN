using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chess;
namespace ChessDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();
            Chess.Chess chess = new Chess.Chess(); // "rnbqkbnr/11p1p111/8/8/8/8/1P1P1111/RNBQKBNR w KQkq - 0 1");
            List<string> list;
            while (true)
            {
                list = chess.GetAllMoves();
                Console.WriteLine(chess.fen);
                Console.WriteLine(ChessToAsccii(chess));
                Console.WriteLine(chess.IsCheck() ? "Check" : "-");
                foreach (string moves in list)
                    Console.Write(moves + "\t");
                Console.WriteLine();
                Console.WriteLine("> ");
                string move = Console.ReadLine();
                if (move == "q") break;
                if (move == "") move = list[random.Next(list.Count)];
                chess = chess.Move(move);
            }
        }

        static string ChessToAsccii (Chess.Chess chess)
        {
            string text = " +-----------------+\n";
            for (int y = 7; y >= 0; y--)
            {
                text += y + 1;
                text += " | ";
                for (int x = 0; x < 8; x++)
                    text += chess.GetFigureAt(x, y) + " ";
                text += "|\n";
            }
            text += " +-----------------+\n";
            text += "   a b c d  e f  g h\n";
            return text;
        }


    }
}
