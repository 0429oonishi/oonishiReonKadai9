//
//  ViewController.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    @IBOutlet private weak var prefectureNameLabel: UILabel!
    @IBOutlet private weak var prefectureChoiceButton: UIButton!
    
    private let viewModel: ViewModelType = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.inputs.viewDidLoad()
        
    }
    
    private func setupBindings() {
        prefectureChoiceButton.rx.tap
            .subscribe(onNext: {
                self.viewModel.inputs.prefectureChoiceButtonDidTapped() {
                    let prefecturesVC = PrefecturesViewController.instantiate()
                    prefecturesVC.delegate = self
                    self.present(prefecturesVC, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)

        viewModel.outputs.prefectureName
            .drive(prefectureNameLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

extension ViewController: PrefecturesViewControllerDelegate {
    func prefecturesVC(text: String) {
        viewModel.inputs.backed(text: text)
    }
}
