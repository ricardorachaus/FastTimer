//
//  FastTimer.swift
//  FastTimer
//
//  Created by Ricardo Rachaus on 05/08/19.
//  Copyright © 2019 ricardorachaus. All rights reserved.
//

import Foundation

public final class FastTimer {
    
    private(set) public var countdown: UInt64 = 0
    private let timeInterval: TimeInterval
    private let block: (FastTimer) -> Void
    private var isRunning: Bool = false
    private let nanoToSeconds: TimeInterval = 1000000000
    
    /**
     Initialize a instance of the timer.
     
     - parameters:
         - timeInterval: Interval in seconds that executes the block.
         - countdown: How many seconds that will execute the timer.
         - block: Block that will be executed after each interval.
     
     - Returns: self: FastTimer
     */
    public init(timeInterval: TimeInterval,
                countdown: UInt64,
                block: @escaping (FastTimer) -> Void) {
        self.timeInterval = timeInterval
        self.countdown = countdown
        self.block = block
    }
    
    /**
     Starts the timer until the runs the exactly times of the countdown including when in 0.
     If the timer has been stopped before the countdown, use this method to execute the timer from where it was.
     */
    public func start() {
        var info = mach_timebase_info()
        guard mach_timebase_info(&info) == KERN_SUCCESS else {
            return
        }
        
        var start = mach_absolute_time()
        var deltaTime: TimeInterval = 0
        var end: UInt64 = 0
        var elapsed: UInt64 = 0
        isRunning = true
        DispatchQueue.main.async {
            while (self.isRunning) {
                end = mach_absolute_time()
                elapsed = end - start
                start = end
                deltaTime += TimeInterval(elapsed * UInt64(info.numer) / UInt64(info.denom)) / self.nanoToSeconds
                if (deltaTime > self.timeInterval && self.countdown > 0) {
                    self.block(self)
                    if (deltaTime > 1.5 * self.timeInterval) {
                        self.countdown = UInt64(deltaTime) - self.countdown
                    }
                    self.countdown -= UInt64(self.timeInterval)
                    deltaTime = 0
                } else if (self.countdown == 0) {
                    self.block(self)
                    self.stop()
                }
            }
        }
    }
    
    /**
        Stops the timer at any time.
     */
    public func stop() {
        isRunning = false
    }
    
}
