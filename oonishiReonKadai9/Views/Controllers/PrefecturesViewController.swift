//
//  PrefecturesViewController.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import UIKit
import RxSwift
import RxCocoa

protocol PrefecturesViewControllerDelegate: AnyObject {
    func prefecturesVC(text: String)
}

final class PrefecturesViewController: UIViewController {

    private let viewModel: PrefecturesViewModelType = PrefecturesViewModel()
    
    @IBOutlet private weak var cancelButton: UIBarButtonItem!
    
    private var prefectures: [Prefecture] {
        viewModel.outputs.prefectures
    }

    private var prefectureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var prefectureButtons = [UIButton]()
    var delegate: PrefecturesViewControllerDelegate?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        self.view.addSubview(prefectureStackView)
        setupPrefectureButtons()
        setupStackView()
        setupStackViewLayout()
        
    }
    
    private func setupBindings() {
        cancelButton.rx.tap
            .subscribe(onNext: viewModel.inputs.didTapCancelButton)
            .disposed(by: disposeBag)

        viewModel.outputs.event
            .subscribe(onNext: { [weak self] in
                switch $0 {
                case .dismiss:
                    self?.dismiss(animated: true, completion: nil)
                case .returnSelectedName(let name):
                    self?.delegate?.prefecturesVC(text: name)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setupPrefectureButtons() {
        prefectures.forEach { prefecture in
            let button = UIButton()
            button.setTitle(prefecture.name, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.tag = prefecture.id
            button.addTarget(self, action: #selector(prefectureButtonDidTapped), for: .touchUpInside)
            prefectureButtons.append(button)
        }
    }
    
    private func setupStackView() {
        prefectureButtons.forEach { prefectureButton in
            prefectureStackView.addArrangedSubview(prefectureButton)
        }
    }
    
    private func setupStackViewLayout() {
        NSLayoutConstraint.activate([
            prefectureStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            prefectureStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50),
            prefectureStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50),
            prefectureStackView.heightAnchor.constraint(equalToConstant: CGFloat(prefectureButtons.count * 50)),
        ])
    }
    
    static func instantiate() -> PrefecturesViewController {
        let storyboard = UIStoryboard(name: "Prefectures", bundle: nil)
        let prefecturesVC = storyboard.instantiateViewController(
            withIdentifier: "PrefecturesViewController"
        ) as! PrefecturesViewController
        prefecturesVC.modalPresentationStyle = .fullScreen
        return prefecturesVC
    }
    
    @objc private func prefectureButtonDidTapped(sender: UIButton) {
        viewModel.inputs.didTapPrefectureButton(index: sender.tag)
    }
}
