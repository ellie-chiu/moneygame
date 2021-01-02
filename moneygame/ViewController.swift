//
//  ViewController.swift
//  moneygame
//
//  Created by TINA on 2021/1/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var SelecCharacter: UISegmentedControl!
   
    @IBOutlet weak var thQtyAm: UILabel!
    @IBOutlet weak var fhQtyAm: UILabel!
    @IBOutlet weak var twQtyAm: UILabel!
    @IBOutlet weak var hQtyAm: UILabel!
    
    @IBOutlet weak var thStepper: UIStepper!
    @IBOutlet weak var fhStepper: UIStepper!
    @IBOutlet weak var twStepper: UIStepper!
    @IBOutlet weak var hStepper: UIStepper!
    
    @IBOutlet weak var TotalAmountLabel: UILabel!
    
    //設定紅包價錢
    let grandparentPrice = 8800
    let unclePrice = 6600
    let parentPrice = 3800
    
    //設定圖片
    let grandparentPicture = UIImage(named: "grandparent")
    let parentPicture = UIImage(named: "pa2")
    let unclePicture = UIImage(named: "uncle")
    
    //
    var thousandnumber: Int = 0
    var fivehundrednumber: Int = 0
    var twohunderdnumber: Int = 0
    var hundrednumber: Int = 0
    
    //sum
    func total() {
        let totalamount = thousandnumber*1000 + fivehundrednumber*500+twohunderdnumber*200+hundrednumber*100
        TotalAmountLabel.text = "\(totalamount)"
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func chooseWho(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            characterImageView.image = grandparentPicture
            PriceLabel.text = "$\(grandparentPrice)"
        }
        else if sender.selectedSegmentIndex == 1 {
            characterImageView.image = parentPicture
            PriceLabel.text = "$\(parentPrice)"
        }
        else {
            characterImageView.image = unclePicture
            PriceLabel.text = "$\(unclePrice)"
        }
    }
    
    //stepper setting
    @IBAction func calculateamount(_ sender: UIStepper) {
        thousandnumber = Int(thStepper.value)
        fivehundrednumber = Int(fhStepper.value)
        twohunderdnumber = Int(twStepper.value)
        hundrednumber = Int(hStepper.value)
        
        thQtyAm.text = "\(thousandnumber)"
        fhQtyAm.text = "\(fivehundrednumber)"
        twQtyAm.text = "\(twohunderdnumber)"
        hQtyAm.text = "\(hundrednumber)"
        
        total()
    }
    
    @IBAction func checkout(_ sender: UIButton) {
        if SelecCharacter.selectedSegmentIndex == 0 {
            if TotalAmountLabel.text == "\(grandparentPrice)"{
            resultLabel.text = "恭喜發財！紅包拿來"
            }
            else if TotalAmountLabel.text! < "\(grandparentPrice)"{
                resultLabel.text = "今年賺大錢！多加點"
            }
            else if TotalAmountLabel.text! > "\(grandparentPrice)"{
                resultLabel.text = "今年沒賺這麼多..."
            }
        }
        else if SelecCharacter.selectedSegmentIndex == 1 {
            if TotalAmountLabel.text == "\(parentPrice)"{
                resultLabel.text = "恭喜發財！紅包拿來"
            }
            else if TotalAmountLabel.text! < "\(parentPrice)"{
                resultLabel.text = "今年賺大錢！多加點"
            }
            else if TotalAmountLabel.text! > "\(parentPrice)"{
                resultLabel.text = "今年沒賺這麼多..."
            }
    
            }
        else {
            if TotalAmountLabel.text == "\(unclePrice)"{
                resultLabel.text = "恭喜發財！紅包拿來"
            }
            else if TotalAmountLabel.text! < "\(unclePrice)"{
                resultLabel.text = "今年賺大錢！多加點"
            }
            else if TotalAmountLabel.text! > "\(unclePrice)"{
                resultLabel.text = "今年沒賺這麼多..."
            }
    
            }
            
        }
    
    @IBAction func playagain(_ sender: UIButton) {
        SelecCharacter.selectedSegmentIndex = 0
        characterImageView.image = grandparentPicture
        PriceLabel.text = "$\(grandparentPrice)"
        thStepper.value = 0
        fhStepper.value = 0
        thStepper.value = 0
        hStepper.value = 0
        
        thQtyAm.text = "0"
        fhQtyAm.text = "0"
        twQtyAm.text = "0"
        hQtyAm.text = "0"
        
        TotalAmountLabel.text = "0"
        resultLabel.text = ""
    }
}
    
    

