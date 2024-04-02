
import UIKit

class TableViewCellAnswer: UITableViewCell {
    @IBOutlet weak var lbl_ques: UILabel!
    
    @IBOutlet weak var lbl_ans: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(question: String, correctAnswer: String) {
        self.lbl_ques.text = question
        self.lbl_ans.text = "Answer: \(correctAnswer)"
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
