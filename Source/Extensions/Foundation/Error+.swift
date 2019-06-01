//
//  Error+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import Foundation

public protocol OurErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

public struct CustomError: OurErrorProtocol {
    
    public var title: String?
    public var code: Int
    public var errorDescription: String? { return _description }
    public var failureReason: String? { return _description }
    
    private var _description: String
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}

