//
//  ViewController.swift
//  Light
//
//  Created by Евгений on 29.06.2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Переменная включен или выключен фонарик
    var isLightOn = true
    
    // Функция включающая/выключающая фонарик
    func updateView() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        } else {
            view.backgroundColor = isLightOn ? .white : .black
        }
    }
    
    // Нажатие на кнопку включения/выключения фонарика
    @IBAction func LightOnButton(_ sender: UIButton) {
        isLightOn = !isLightOn
        updateView()
    }
    
    // Убирает статус бар
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

