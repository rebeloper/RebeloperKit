//
//  URL+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

extension URL {
    public func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
