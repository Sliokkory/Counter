//
//  ViewController.swift
//  Counter
//
//  Created by Илья Подлесный on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var historyTextArea: UITextView!
    @IBOutlet weak private var minusCountButton: UIButton!
    @IBOutlet weak private var plusCountButton: UIButton!
    @IBOutlet weak private var clearCountButton: UIButton!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minusCountButton.tintColor = .blue
        plusCountButton.tintColor = .red
        clearCountButton.tintColor = .black
    }
    
    public func currentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let result = "[\(hour):\(minutes):\(seconds)]:"
        return result
    }

    @IBAction private func minusCountButtonPressed(_ sender: Any) {
        if count == 0 {
            historyTextArea.text += "\n\n\(currentDate()) попытка уменьшить значение счётчика ниже 0"
        } else {
            historyTextArea.text += "\n\n\(currentDate()) значение изменено на -1"
            count -= 1
            countLabel.text = String(count)
        }
    }

    @IBAction private func plusCountButtonPressed(_ sender: Any) {
        count += 1
        countLabel.text = String(count)
        historyTextArea.text += "\n\n\(currentDate()) значение изменено на +1"
    }
    
    @IBAction func clearCountButtonPressed(_ sender: Any) {
        count = 0
        countLabel.text = String(count)
        historyTextArea.text += "\n\n\(currentDate()) значение сброшено"
    }
}

