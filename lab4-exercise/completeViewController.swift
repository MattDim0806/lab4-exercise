import UIKit

class completeViewController: UIViewController {
    var closure : ((String) -> ())!
    var myDrink : drink!
    
    @IBOutlet weak var orderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderLabel.text = String(format:"您的飲料：%@\n甜度為：%@\n冰塊為：%@\n售價：%d", myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomePage(_ sender: Any) {
        let Str = "您的餐點已送出"
        closure(Str)
        dismiss(animated: true, completion: nil)
    }
}
