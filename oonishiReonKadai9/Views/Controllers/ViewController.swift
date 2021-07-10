//
//  ViewController.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var prefectureNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefectureNameLabel.text = "未選択"
        
    }
    
    @IBAction private func prefectureChoiceButtonDidTapped(_ sender: Any) {
        let prefecturesVC = PrefecturesViewController.instantiate()
        prefecturesVC.delegate = self
        present(prefecturesVC, animated: true, completion: nil)
    }
    
}

extension ViewController: PrefecturesViewControllerDelegate {
    func prefecturesVC(text: String) {
        prefectureNameLabel.text = text
    }
}
