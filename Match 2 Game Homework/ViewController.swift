//
//  ViewController.swift
//  Match 2 Game Homework
//
//  Created by Serper Kurmanbek on 26.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayOfPictures = [UIImage(named: "Aston"),UIImage(named: "Audi"), UIImage(named: "Ferrari"), UIImage(named: "Jaguar"), UIImage(named: "Lamborghini"), UIImage(named: "Lexus"),UIImage(named: "Maserati"), UIImage(named: "Mercedes"), UIImage(named: "Mercedes"),UIImage(named: "Maserati"),UIImage(named: "Lexus"), UIImage(named: "Lamborghini"),UIImage(named: "Jaguar"), UIImage(named: "Ferrari"), UIImage(named: "Audi"),UIImage(named: "Aston")]
    var state = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    var lastOpenedButton = 0
    var isOpened = false
    var timer = Timer()
    var time = 0
    var senderTag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
        
    @IBAction func pressButton(_ sender: UIButton) {
        print (sender.tag)
        senderTag = sender.tag
    isOpened = !isOpened
        if isOpened {
            lastOpenedButton = sender.tag
            sender.setBackgroundImage(arrayOfPictures[sender.tag - 1], for: .normal)
        
        }
        if state[sender.tag - 1] == false {
            sender.setBackgroundImage(arrayOfPictures[sender.tag - 1], for: .normal)
            
            if arrayOfPictures[lastOpenedButton - 1] == arrayOfPictures[sender.tag - 1] {
                state[lastOpenedButton - 1] = true
                state[sender.tag - 1] = true
                
            

            } else {
                view.isUserInteractionEnabled = false
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
                            }
            
        }
        
        
            
        }
        
    @objc func startTimer() {
        time += 1
        if time == 1 {
            timer.invalidate()
            let button = view.viewWithTag(lastOpenedButton) as! UIButton
            let sender = view.viewWithTag(senderTag) as! UIButton
            button.setBackgroundImage(UIImage(named: "Иконка"), for: .normal)
            sender.setBackgroundImage(UIImage(named: "Иконка"), for: .normal)
            view.isUserInteractionEnabled = true
            
        }
        
    }
    
    
    }
    

