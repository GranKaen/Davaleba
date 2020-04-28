

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BigNum: UILabel!
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Quantity: UITextField!
    @IBOutlet weak var Price: UITextField!
    
    var j: Int = 0
    var z: Int = 0
    var y: String = ""
    var x: String = ""
    var i: Int = 0
    var sulfasi: Int = 0
    var sulwona: Int = 0
    @IBAction func addNum(_ sender: UIButton) {
        i += 1
        let b = String(i)
        BigNum.text = b
        y = String(Quantity.text!)
        x = String(Price.text!)
        j = Int(y)!
        z = Int(x)!
        sulfasi += z
        sulwona += j
        
        performSegue(withIdentifier: "segue_for_second_page", sender: nil)
        }
    
    
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
        
        if identifier == "segue_for_second_page"{
            if let secondPageVC = segue.destination as? SecondViewController {
                secondPageVC.text1 = String(sulfasi)
                secondPageVC.text = String(sulwona)
            }
        }
    }
    }

}

