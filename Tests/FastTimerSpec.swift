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
            
            var sut: FastTimer!
            
            context("when initializing successfully") {
                
                var result: Bool = false
                
                beforeEach {
                    sut = FastTimer(timeInterval: 1, countdown: 1) { _ in
                        result = true
                    }
                    sut.start()
                }
                
                it("should have called block") {
                    expect(result).toEventually(beTrue())
                }
            }
            
            context("when executing more than one time") {
                
                var count: UInt64 = 0
                
                beforeEach {
                    sut = FastTimer(timeInterval: 1, countdown: 1) { _ in
                        count += 1
                    }
                    sut.start()
                }
                
                it("should have called block two times") {
                    expect(count).toEventually(equal(2))
                }
            }
        }
    }
}
