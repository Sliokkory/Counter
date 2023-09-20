//
//  ViewController.swift
//  Counter
//
//  Created by Илья Подлесный on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var minusCountBtn: UIButton!
    @IBOutlet weak var plusCountBtn: UIButton!
    @IBOutlet weak var clearCountBtn: UIButton!
    @IBOutlet weak var historyTextArea: UITextView!

    var countLabel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        minusCountBtn.tintColor = .blue
        plusCountBtn.tintColor = .red
        clearCountBtn.tintColor = .black
    }
    
    @IBAction func onMinusPress(_ sender: Any) {
        if countLabel == 0 {
            historyTextArea.text += "\n\n\(currentDate()) попытка уменьшить значение счётчика ниже 0"
        } else {
            historyTextArea.text += "\n\n\(currentDate()) значение изменено на -1"
            countLabel -= 1
            count.text = String(countLabel)
        }
    }
    
    @IBAction func onPlusPress(_ sender: Any) {
        countLabel += 1
        count.text = String(countLabel)
        historyTextArea.text += "\n\n\(currentDate()) значение изменено на +1"
    }
    @IBAction func onClearPress(_ sender: Any) {
        countLabel = 0
        count.text = String(countLabel)
        historyTextArea.text += "\n\n\(currentDate()) значение сброшено"
    }
    
    func currentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let result = "[\(hour):\(minutes):\(seconds)]:"
        return result
    }
}

