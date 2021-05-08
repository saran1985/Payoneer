//
//  Networks.swift
//  Payments
//
//  Created by Saranya ramamoorthy on 30/04/21.
//


import Foundation

class Networks: NSObject, Decodable {
    /// Collection of applicable payment networks that could be used by a customer to complete the payment in scope of this `LIST` session
    let applicable: [ApplicableNetwork]
}
