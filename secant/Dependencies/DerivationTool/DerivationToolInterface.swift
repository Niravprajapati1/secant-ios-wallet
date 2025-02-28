//
//  DerivationToolInterface.swift
//  secant-testnet
//
//  Created by Lukáš Korba on 12.11.2022.
//

import ComposableArchitecture
import ZcashLightClientKit

extension DependencyValues {
    var derivationTool: DerivationToolClient {
        get { self[DerivationToolClient.self] }
        set { self[DerivationToolClient.self] = newValue }
    }
}

struct DerivationToolClient {
    /// Given a seed and a number of accounts, return the associated spending keys.
    /// - Parameter seed: the seed from which to derive spending keys.
    /// - Parameter accountIndex: Index of account to use. Multiple accounts are not fully
    /// supported so the default value of 0 is recommended.
    /// - Returns: the spending keys that correspond to the seed, formatted as Strings.
    var deriveSpendingKey: ([UInt8], Int) throws -> UnifiedSpendingKey

    /// Checks validity of the transparent address.
    var isValidTransparentAddress: (String) throws -> Bool

    /// Checks validity of the shielded address.
    var isValidSaplingAddress: (String) throws -> Bool

    /// Checks if given address is a valid zcash address.
    var isValidZcashAddress: (String) throws -> Bool
}
