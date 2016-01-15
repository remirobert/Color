//
//  main.swift
//  Colors
//
//  Created by Remi Robert on 13/01/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import Foundation

private let codeOpen = "\u{001B}[0;"
private let codeClose = "m"

public typealias ColorComponentCode = Int

public protocol ColorComponent {
    var description: String {get}
    var code: ColorComponentCode {get}
}

public enum Color: String, ColorComponent {
    
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white
    
    public var code: ColorComponentCode {
        switch self {
        case black: return 30
        case red: return 31
        case green: return 32
        case yellow: return 33
        case blue: return 34
        case magenta: return 35
        case cyan: return 36
        case white: return 37
        }
    }
    
    public var description: String {
        switch self {
        case .black: return "black"
        case .red: return "red"
        case .green: return "green"
        case .yellow: return "yellow"
        case .blue: return "blue"
        case .magenta: return "magenta"
        case .cyan: return "cyan"
        case .white: return "white"
        }
    }
}

public enum Style: ColorComponent {
    
    case reset
    case bold
    case dim
    case italic
    case underline
    case inverse
    case hidden
    case strikethrough
    
    public var code: ColorComponentCode {
        switch self {
        case reset: return 0
        case bold: return 1
        case dim: return 2
        case italic: return 3
        case underline: return 4
        case inverse: return 7
        case hidden: return 8
        case strikethrough: return 9
        }
    }
    
    public var description: String {
        switch self {
        case .reset: return "reset"
        case .bold: return "bold"
        case .dim: return "dim"
        case .italic: return "italic"
        case .underline: return "underline"
        case .inverse: return "inverse"
        case .hidden: return "hidden"
        case .strikethrough: return "strikethrough"
        }
    }
}

public enum Background: String, ColorComponent {
    
    case bgBlack
    case bgRed
    case bgGreen
    case bgYellow
    case bgBlue
    case bgMagenta
    case bgCyan
    case bgWhite
    
    public var code: ColorComponentCode {
        switch self {
        case bgBlack: return 40
        case bgRed: return 41
        case bgGreen: return 42
        case bgYellow: return 43
        case bgBlue: return 44
        case bgMagenta: return 45
        case bgCyan: return 46
        case bgWhite: return 47
        }
    }
    
    public var description: String {
        switch self {
        case .bgBlack: return "bgBlack"
        case .bgRed: return "bgRed"
        case .bgGreen: return "bgGreen"
        case .bgYellow: return "bgYellow"
        case .bgBlue: return "bgBlue"
        case .bgMagenta: return "bgMagenta"
        case .bgCyan: return "bgCyan"
        case .bgWhite: return "bgWhite"
        }
    }
}

public extension ColorComponentCode {
    func wrap() -> String {
        return "\(codeOpen)\(self)\(codeClose)"
    }
}

public extension String {
    func addColor(colorComponent: ColorComponent) -> String {
        return self + colorComponent.code.wrap()
    }
}

public func + (let left: String, let right: ColorComponent) -> String {
    return left + right.code.wrap()
}
