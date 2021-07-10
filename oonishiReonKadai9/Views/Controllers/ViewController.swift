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
        let storyboard = UIStoryboard(name: "Prefectures", bundle: nil)
        let prefecturesVC = storyboard.instantiateViewController(withIdentifier: "PrefecturesViewController") as! PrefecturesViewController
        prefecturesVC.modalPresentationStyle = .fullScreen
        present(prefecturesVC, animated: true, completion: nil)
    }
    
}

