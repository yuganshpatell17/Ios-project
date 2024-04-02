 

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet weak var startingDAte: UILabel!
    @IBOutlet weak var Customername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }

    
}
