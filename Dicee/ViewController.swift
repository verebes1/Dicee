//
//  ViewController.swift
//  Dicee
//
//  Created by verebes on 05/03/2018.
//  Copyright © 2018 A&D Progress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollTheDices()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollTapped(_ sender: UIButton) {
        rollTheDices()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        rollTheDices()
    }
    
    func animateDices() {
        var diceImagesArray = [UIImage]()
        for i in 1...6 {
            diceImagesArray.append(UIImage.init(named: "dice\(i)")!)
        }
        diceImageView1.animationImages = diceImagesArray
        diceImageView2.animationImages = diceImagesArray.reversed()
        diceImageView1.animationDuration = 1.0
        diceImageView2.animationDuration = 1.0
        diceImageView1.animationRepeatCount = 1
        diceImageView2.animationRepeatCount = 1
        diceImageView1.startAnimating()
        diceImageView2.startAnimating()
    }
    
    func rollTheDices(){
        animateDices()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            var diceRolled = 0
            diceRolled = Int(arc4random_uniform(6))
            self.diceImageView1.image = UIImage.init(named: "dice\(diceRolled + 1)")
            diceRolled = Int(arc4random_uniform(6))
            self.diceImageView2.image = UIImage.init(named: "dice\(diceRolled + 1)")
        }
    }
    
}

