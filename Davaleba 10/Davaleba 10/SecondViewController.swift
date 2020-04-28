

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var AllPrice: UILabel!
    
    @IBOutlet weak var AllQuantity: UILabel!
    
    var text: String?
    var text1: String?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllQuantity.text = text
        AllPrice.text = text1
        
    }
    

    
    

}
