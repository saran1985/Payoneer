//
//  PresetAccount.swift
//  Payments
//
//  Created by Saranya ramamoorthy on 30/04/21.
//

import Foundation

class PresetAccount: NSObject, Decodable {
    /// Collection of links related to this `PRESET` account.
    let links: [String: URL]

    /// Code of preset network
    let code: String

    /// Masked account of preset account; sensitive fields of the account are removed, truncated, or replaced with mask characters.
    let maskedAccount: AccountMask?

    /// Indicates that form for this account is empty, without any text and input elements.
    let emptyForm: Bool

    /// Code of button-label for this preset account.
    let button: String

    /// Redirect object to summary page of merchants web-site.
    let redirect: Redirect

    /// Map of public available contract data from the first possible route for this preset account.
//    let contractData: String?
}

