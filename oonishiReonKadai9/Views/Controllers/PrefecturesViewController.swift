//
//  PrefecturesViewController.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import UIKit

final class PrefecturesViewController: UIViewController {
    
    private let prefectures = Prefecture.data

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func instantiate() -> PrefecturesViewController {
        let storyboard = UIStoryboard(name: "Prefectures", bundle: nil)
        let prefecturesVC = storyboard.instantiateViewController(
            withIdentifier: "PrefecturesViewController"
        ) as! PrefecturesViewController
        prefecturesVC.modalPresentationStyle = .fullScreen
        return prefecturesVC
    }
    
}

