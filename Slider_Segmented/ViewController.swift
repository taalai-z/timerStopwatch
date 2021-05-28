//
//  ViewController.swift
//  Slider_Segmented
//
//  Created by Amazing on 5/28/21.
//  Copyright © 2021 Taalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    
    @IBOutlet weak var play_button: UIButton!
    @IBOutlet weak var pause_button: UIButton!
    @IBOutlet weak var stop_button: UIButton!
    
    
    @IBOutlet weak var Hour_label: UILabel!
    @IBOutlet weak var minutes_label: UILabel!
    @IBOutlet weak var second_label: UILabel!
    
    var timer = Timer()
    
    var hour = 0
    var minute = 0
    var second = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slider.maximumValue = 60
        slider.minimumValue = 0
        slider.value = 30
        slider.isHidden = true
        pause_button.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func slider_action(_ sender: UISlider) {
        sender.isContinuous = true
        second = Int(sender.value)
        if Int(sender.value) < 10 {
            second_label.text = "0\(Int(sender.value))"
        } else {
            second_label.text = String(Int(sender.value))
        }
    }
    
    @IBAction func stop_action(_ sender: UIButton) {
        
        
        if segmented.selectedSegmentIndex == 0 {
           second = 0
            second_label.text = "00"
        } else if segmented.selectedSegmentIndex == 1{
            second_label.text = "\(Int(slider.value))"
            second = Int(slider.value)
            slider.isHidden = false
        }
        timer.invalidate()
        minute = 0
        hour = 0
        
        minutes_label.text = "00"
        
        Hour_label.text = "00"
        
        
        play_button.isEnabled = true
        pause_button.isEnabled = true
        
    }
    
    @IBAction func pause_action(_ sender: UIButton) {
        timer.invalidate()
        pause_button.isEnabled = false
        play_button.isEnabled = true
        
    }
    
    @IBAction func play_action(_ sender: UIButton) {
        if segmented.selectedSegmentIndex == 0 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            
        } else if segmented.selectedSegmentIndex == 1{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer_counter), userInfo: nil, repeats: true)
            slider.isHidden = true
        }
        play_button.isEnabled = false
        pause_button.isEnabled = true
    }
    
        
    @objc func counter() {
        second += 1
        
        if second < 10{
            second_label.text = "0\(second)"
        }else{
            second_label.text = String(second)
        }
        
        
        if second == 60{
            minute += 1
            if minute < 10 {
                minutes_label.text = "0\(minute)"
            } else {
               minutes_label.text = String(minute)
            }
        }
        
        if minute == 60 {
            hour += 1
            if hour < 10{
                Hour_label.text = "0\(hour)"
            }else{
                Hour_label.text = String(hour)
            }
        }
    }
    
    
    @objc func timer_counter(){
        second -= 1
        if second < 10 {
            second_label.text = "0\(second)"
        }else{
            second_label.text = "\(second)"
        }
        if second == 0 {
            timer.invalidate()
        }
    }
    
    @IBAction func segmented_action(_ sender: UISegmentedControl) {
    
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0 {
            slider.isHidden = true
            second_label.text = "00"
        }else if sender.selectedSegmentIndex == 1{
            slider.isHidden = false
            second_label.text = "\(Int(slider.value))"
            second = Int(slider.value)
        }
        
        
    }
    
}

