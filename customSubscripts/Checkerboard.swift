//
//  Checkerboard.swift
//  customSubscripts
//
//  Created by Nathaniel Mcdowell on 10/25/20.
//

import Foundation

enum Square:String{
    case empty = "▪️"
    case red = "🔴"
    case white = "⚪️"
}
struct Checkerboard {
    
  
    
    typealias Coordinate = (x: Int, y: Int)
    
    fileprivate var squares: [[Square]] = [
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
            [ .red,   .empty, .red,   .empty, .red,   .empty, .red,   .empty ],
            [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
            [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
            [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
            [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ],
            [ .empty, .white, .empty, .white, .empty, .white, .empty, .white ],
            [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ]
          ]
    
    subscript(coordinate:Coordinate) -> Square {
        get{
            return squares[coordinate.y][coordinate.x]
        }
        set {
            squares[coordinate.y][coordinate.x] = newValue
        }
    }
// These functions eliminated by subscripts
    func piece(at coordinate:Coordinate) -> Square {
        return squares[coordinate.y][coordinate.x]
    }
    
    mutating func setPiece(at coordinate:Coordinate, to newValue:Square){
        squares[coordinate.y][coordinate.x] = newValue
    }
    //implement second subscript using the first
    subscript(x: Int, y: Int) -> Square {
        get {
            return self[(x: x, y: y)]
        }
        set {
            self[(x: x, y: y)] = newValue
        }
    }
}

extension Checkerboard: CustomStringConvertible {
    
    var description: String {
        return squares.map{row in row.map{ $0.rawValue}.joined(separator: "") }
            .joined(separator: "\n") + "\n"
        
    }
}
