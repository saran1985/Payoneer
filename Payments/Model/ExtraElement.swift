//
//  ExtraElement.swift
//  Payments
//
//  Created by Saranya ramamoorthy on 30/04/21.
//

import Foundation

class ExtraElement: NSObject, Decodable {
    /// Descriptive text that should be displayed for this extra element.
    let text: String?

    /// Checkbox parameters, 'null' if this extra element is a label.
    let checkbox: Checkbox?
}
