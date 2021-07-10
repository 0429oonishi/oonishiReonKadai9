//
//  PrefecturesViewController.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import UIKit

protocol PrefecturesViewControllerDelegate: AnyObject {
    func prefecturesVC(text: String)
}

final class PrefecturesViewController: UIViewController {
    
    private let prefectures = Prefecture.data
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(prefectureStackView)
        setupPrefectureButtons()
        setupStackView()
        setupStackViewLayout()
        
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
        let name = prefectures[sender.tag].name
        delegate?.prefecturesVC(text: name)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

