//
//  homeViewController.swift
//  lab4-exercise
//
//  Created by Meng Chi Chen on 2023/4/1.
//

import UIKit

class drink : NSObject{
    var name : String = ""
    var sweetness : String = ""
    var sweetSelectIndex : Int = 0
    var ice : String = ""
    var iceSelectIndex : Int = 0
    var price : Int = 0
}

class homeViewController: UIViewController {
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var showOrderLabel: UILabel!
    @IBOutlet weak var completeBtn: UIBarButtonItem!
    var myDrink : drink!
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrderLabel.text = "您尚未點餐"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(myDrink != nil){
            startBtn.setTitle("修改訂單", for: .normal)
            completeBtn.isEnabled = true
            showOrderLabel.text = String(format: "您的飲料：%@\n甜度為：%@\n冰塊為：%@\n售價：%d", myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
        }
        else{
            completeBtn.isEnabled = false
            startBtn.setTitle("開始點餐", for: .normal)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "orderSegue"){
            let VC = segue.destination as! orderViewController
            VC.myDrink = myDrink
            VC.delegate = self
        }
        /*if(segue.identifier == "completeSegue"){
            let VC = segue.destination as! completeViewController
            VC.closure = { (msg:String) -> () in
                self.myDrink = nil
                self.showOrderLabel.text = msg
                self.startBtn.setTitle("開始點餐", for: .normal)
                self.completeBtn.isEnabled = false
            }
            
        }*/
    }
    
    @IBAction func completeBtnClick(_ sender: Any) {
        let VC = completeViewController()
        VC.myDrink = myDrink
        VC.closure = { (msg:String) -> () in
            self.myDrink = nil
            self.showOrderLabel.text = msg
            self.startBtn.setTitle("開始點餐", for: .normal)
            self.completeBtn.isEnabled = false
        }
        present(VC, animated: true, completion: nil)
    }
}

extension homeViewController:orderViewControllerDelegate{
    func sendOrder(myOrder: drink) {
        myDrink = myOrder
    }
}
