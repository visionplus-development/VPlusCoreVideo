//
//  Timer.swift
//  VPlusCoreVideo
//
//  Created by ERWINDO SIANIPAR on 08/08/2023.
//

protocol VPTimerDelegate {
    func timerEvent()
}

class VPTimer {
    
    static var delegate: VPTimerDelegate?
    static var interval: TimeInterval = 60
    
    private static var timer: DispatchSourceTimer?
    private static var isRunning = false
    
    static func start() {
        guard !isRunning else { return }
        
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.main)
        timer?.schedule(deadline: .now(), repeating: interval)
        timer?.setEventHandler {
            self.fired()
        }
        timer?.resume()
        
        isRunning = true
    }
    
    static func stop() {
        guard isRunning else { return }
        
        timer?.cancel()
        timer = nil
        isRunning = false
    }
    
    private static func fired() {
        self.delegate?.timerEvent()
    }
}
