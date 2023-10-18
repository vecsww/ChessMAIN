using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chess
{
    class Moves
    {
        FigureMoving fm;
        Board board;

        public Moves (Board board)
        {
            this.board = board;
        }

        public bool CanMove (FigureMoving fm)
        {
            this.fm = fm;
            return
                CanMoveFrom() &&
                CanMoveTo() &&
                CanFigureMove();
        }

        bool CanMoveFrom()
        {
            return fm.from.Onboard() &&
                fm.figure.GetColor() == board.moveColor;
        }

        bool CanMoveTo ()
        {
            return fm.to.Onboard() &&
                fm.from != fm.to &&
                board.GetFigureAt(fm.to).GetColor() != board.moveColor; //проверка своя ли это фигура
        }

        bool CanFigureMove ()
        {
            switch (fm.figure)
            {
                case Figure.whiteKing:
                case Figure.blackKing:
                    return CanKingMove();

                case Figure.whiteQueen:
                case Figure.blackQueen:
                    return CanStraightMove();

                case Figure.whiteRook:
                case Figure.blackRook:
                    return (fm.SignX == 0 || fm.SignY == 0) &&
                        CanStraightMove();

                case Figure.whiteBishop:
                case Figure.blackBishop:
                    return (fm.SignX != 0 && fm.SignY != 0) &&
                            CanStraightMove();      

                case Figure.whiteKnight:
                case Figure.blackKnight:
                    return CanKnightMove();

                case Figure.whitePawn:
                case Figure.blackPawn:
                    return CanPawnMove();

                default: return false;
            }

             bool CanKingMove()
            {
                if (fm.AbsDeltaX <= 1 && fm.AbsDeltaY <= 1)
                    return true;
                return false;
            }
             bool CanKnightMove()
            {
                if (fm.AbsDeltaX == 1 && fm.AbsDeltaY == 2) return true;
                if (fm.AbsDeltaX == 2 && fm.AbsDeltaY == 1) return true;
                return false;


            }
        }

        bool CanPawnMove()
        {
            if (fm.from.y < 1 || fm.from.y > 6)
                return false;
            int StepY = fm.figure.GetColor() == Color.white ? 1 : -1;
            return
                CanPawnGo(StepY) ||
                CanPawnJump(StepY) ||
                CanPawnEat(StepY);
        }

        private bool CanPawnGo(int stepY)
        {
            if (board.GetFigureAt(fm.to) == Figure.none)
                if (fm.DeltaX == 0)
                    if (fm.DeltaY == stepY)
                        return true;
            return false;
        }

        private bool CanPawnJump(int stepY)
        {
            if (board.GetFigureAt(fm.to) == Figure.none)
                if (fm.DeltaX == 0)
                    if (fm.DeltaY == 2 * stepY)
                        if (fm.from.y == 1 || fm.from.y == 6)
                            if (board.GetFigureAt(new Square(fm.from.x, fm.from.y + stepY)) == Figure.none)
                                return true;
            return false;

                                
        }

        private bool CanPawnEat(int stepY)
        {
            if (board.GetFigureAt(fm.to) != Figure.none)
                if (fm.AbsDeltaX == 1)
                    if (fm.DeltaY == stepY)
                        return true;
            return false;
        }

        private bool CanStraightMove()
        {
            Square at = fm.from;
            do
            {
                at = new Square(at.x + fm.SignX, at.y + fm.SignY);
                if (at == fm.to)
                    return true;
            } while (at.Onboard() &&
                    board.GetFigureAt(at) == Figure.none);
            return false;
        }
    }
}
