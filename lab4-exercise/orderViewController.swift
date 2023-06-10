//
//  orderViewController.swift
//  lab4-exercise
//
//  Created by Meng Chi Chen on 2023/4/1.
//

import UIKit

class orderViewController: UIViewController {
    var myDrink : drink!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sweetSelect: UISegmentedControl!
    @IBOutlet weak var iceSelect: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    weak var delegate : orderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(myDrink != nil){
            nameTextField.text = myDrink.name
            sweetSelect.selectedSegmentIndex = myDrink.sweetSelectIndex
            iceSelect.selectedSegmentIndex = myDrink.iceSelectIndex
            priceTextField.text = String(myDrink.price)
        }
    }
    
    @IBAction func sendBtnClick(_ sender: Any) {
        if(myDrink == nil){
            myDrink = drink()
        }
        myDrink.name = nameTextField.text ?? ""
        myDrink.sweetSelectIndex = sweetSelect.selectedSegmentIndex
        myDrink.sweetness = sweetSelect.titleForSegment(at: sweetSelect.selectedSegmentIndex)!
        myDrink.iceSelectIndex = iceSelect.selectedSegmentIndex
        myDrink.ice = iceSelect.titleForSegment(at: iceSelect.selectedSegmentIndex)!
        myDrink.price = Int(priceTextField.text ?? "") ?? 0
        delegate?.sendOrder(myOrder: myDrink)
        navigationController?.popViewController(animated: true)
    }
}


@objc protocol orderViewControllerDelegate{
    func sendOrder(myOrder : drink)
}
