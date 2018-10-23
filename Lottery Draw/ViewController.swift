//
//  ViewController.swift
//  Lottery Draw
//
//  Created by Hans van Riet on 08/11/2017.
//  Copyright © 2017 Hans van Riet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SuperLottoPlus: UITextField!
    @IBOutlet weak var MegaMillions: UITextField!
    @IBOutlet weak var Powerball: UITextField!
    
    @IBAction func newNumbers(_ sender: Any) {
        // run and display my lottery numbers
        getSomeRandomNumbers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // run and display my lottery numbers
        getSomeRandomNumbers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickMegaMillions(){
        
        // Mega Millions: five different numbers from 1 to 70
        // and one number from 1 to 25
        let NUMBERS_TO_PICK = 5
        let MEGAMILLIONS_UPPERBOUNDS = UInt32(70)
        let EXTRA_NUMBER_UPPERBOUNDS = UInt32(25)
        
        let display: String = generateNumbers(amount: NUMBERS_TO_PICK, limit: MEGAMILLIONS_UPPERBOUNDS, extraLimit: EXTRA_NUMBER_UPPERBOUNDS)
        
        MegaMillions.text = display
        
        print("MegaMillions Winning Numbers: ", display)
    }
    
    func pickSuperLottoPlus(){
        
        // Super Lotto Plus: Pick five lucky numbers from 1 to 47
        // and one MEGA number from 1 to 27
        let NUMBERS_TO_PICK = 5
        let SUPERLOTTOPLUS_UPPERBOUNDS = UInt32(47)
        let MEGA_NUMBER_UPPERBOUNDS = UInt32(27)
        
        let display: String = generateNumbers(amount: NUMBERS_TO_PICK, limit: SUPERLOTTOPLUS_UPPERBOUNDS, extraLimit: MEGA_NUMBER_UPPERBOUNDS)
        
        SuperLottoPlus.text = display
        
        print("Super Lotto Plus Winning Numbers: ", display)
        
    }
    
    func pickPowerball(){
        
        // Mega Millions: five different numbers from 1 to 75
        // and one number from 1 to 15
        let NUMBERS_TO_PICK = 5
        let POWERBALL_UPPERBOUNDS = UInt32(69)
        let EXTRA_NUMBER_UPPERBOUNDS = UInt32(26)
        
        let display: String = generateNumbers(amount: NUMBERS_TO_PICK, limit: POWERBALL_UPPERBOUNDS, extraLimit: EXTRA_NUMBER_UPPERBOUNDS)
        
        Powerball.text = display
        
        print("Powerball Winning Numbers: ", display)
    }
    
    func generateNumbers(amount: Int, limit: UInt32, extraLimit: UInt32) -> String {
        
        // Draw the extranumber based on extraLimit; in the range 1 - extraLimit (inclusive)
        let extraNumber = Int(arc4random_uniform(extraLimit)) + 1
        
        // Create an empty winning numbers array
        var winningNumbers = Array<Int>()
        
        // Fill the array with random unique values based on the parameter limit
        // in the range 1 - limit (inclusive)
        repeat {
            let currentPick = Int(arc4random_uniform(limit)) + 1
            if !(winningNumbers.contains(currentPick)){
                winningNumbers.append(currentPick)
            }
        } while (winningNumbers.count < amount)
        
        // Sort the winning numbers array for display purposes
        winningNumbers.sort()
        
        // Convert the array to a string for display and append the extra number
        var display : String = ""
        
        for element in winningNumbers{
            display.append(String(element))
            display.append("  ")
        }
        display.append("   --->    ")
        display.append(String(extraNumber))
        
        return display
        
    }
    
    func getSomeRandomNumbers(){
        pickMegaMillions()
        pickSuperLottoPlus()
        pickPowerball()
    }


}

