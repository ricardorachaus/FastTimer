//: Playground - noun: a place where people can play

import FastTimer

let timer = FastTimer(timeInterval: 1, countdown: 10) { timer in
    print("Time: \(timer.countdown)")
}
timer.start()
