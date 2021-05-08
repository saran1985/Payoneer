//
//  ExtraElements.swift
//  Payments
//
//  Created by Saranya ramamoorthy on 30/04/21.
//

import Foundation

class ExtraElements: NSObject, Decodable {
    /// Collection of extra elements (labels and checkboxes) that should be displayed on the top of payment page.
    let top: [ExtraElement]?

    /// Collection of extra elements (labels and checkboxes) that should be displayed on the bottom of payment page.
    let bottom: [ExtraElement]?
}
