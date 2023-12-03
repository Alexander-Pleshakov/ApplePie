//
//  ViewController.swift
//  ApplePie
//
//  Created by Александр Плешаков on 03.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lettersButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

