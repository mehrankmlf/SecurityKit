//
//  ViewController.swift
//  Example
//
//  Created by Mehran on 4/24/1401 AP.
//

import UIKit
import SecurityKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var lblJailBroken: UILabel!
    @IBOutlet weak var lblReverseEngineering: UILabel!
    @IBOutlet weak var lblDeviceisSimulator: UILabel!
    @IBOutlet weak var lblVPNActivate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkJailBrokenDevice()
        self.checkReverseEngineering()
        self.checkSimulator()
        self.checkVPNActivate()
        
        ScreenCaptureProtection.shared.delegate = self
        ScreenCaptureProtection.shared.makeProtection(for: self.view)
    }
    
    private func checkJailBrokenDevice() {
        if SecurityKit.isDeviceJailBroken() {
            lblJailBroken.text = "YES"
        }else{
            lblJailBroken.text = "NO"
        }
    }
    
    private func checkReverseEngineering() {
        if SecurityKit.isRevereseEngineeringToolsExecuted() {
            lblReverseEngineering.text = "YES"
        }else{
            lblReverseEngineering.text = "NO"
        }
    }
    
    private func checkSimulator() {
        if SecurityKit.isDeviceSimulator() {
            lblDeviceisSimulator.text = "YES"
        }else{
            lblDeviceisSimulator.text = "NO"
        }
    }
    
    private func checkVPNActivate() {
        if SecurityKit.isVPNConnected() {
            lblVPNActivate.text = "YES"
        }else{
            lblVPNActivate.text = "NO"
        }
    }
}

extension ViewController : ScreenCaptureProtcol {
    func screenRecording(recordStarted: Bool) {
        self.showAlert(message: "")
    }
    
    func screenRecording(recordFinished: Bool) {
        self.showAlert(message: "")
    }
}
