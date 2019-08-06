//
//  FastTimerSpec.swift
//  FastTimer
//
//  Created by Ricardo Rachaus on 01/04/19.
//  Copyright © 2019 ricardorachaus. All rights reserved.
//

import Quick
import Nimble
@testable import FastTimer

class FastTimerSpec: QuickSpec {
    override func spec() {
        describe("FastTimerSpec") {
            it("works") {
                expect(FastTimer.name) == "FastTimer"
            }
        }
    }
}
