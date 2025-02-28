//
//  FeedbackGeneratorTestKey.swift
//  secant-testnet
//
//  Created by Lukáš Korba on 14.11.2022.
//

import ComposableArchitecture
import XCTestDynamicOverlay

extension FeedbackGeneratorClient: TestDependencyKey {
    static let testValue = Self(
        generateSuccessFeedback: XCTUnimplemented("\(Self.self).generateSuccessFeedback"),
        generateWarningFeedback: XCTUnimplemented("\(Self.self).generateWarningFeedback"),
        generateErrorFeedback: XCTUnimplemented("\(Self.self).generateErrorFeedback")
    )
}

extension FeedbackGeneratorClient {
    static let noOp = Self(
        generateSuccessFeedback: { },
        generateWarningFeedback: { },
        generateErrorFeedback: { }
    )
}
