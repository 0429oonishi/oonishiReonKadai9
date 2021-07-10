//
//  ViewModel.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/11.
//

import RxSwift
import RxCocoa

protocol ViewModelInput {
    func viewDidLoad()
    func prefectureChoiceButtonDidTapped(handler: () -> Void)
    func backed(text: String)
}

protocol ViewModelOutput: AnyObject {
    var prefectureName: Driver<String> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {
    
    var prefectureName: Driver<String> {
        prefectureNameRelay
            .asDriver(onErrorDriveWith: .empty())
    }
    private let prefectureNameRelay = PublishRelay<String>()

    func viewDidLoad() {
        prefectureNameRelay.accept("未選択")
    }
    
    func prefectureChoiceButtonDidTapped(handler: () -> Void) {
        handler()
    }
    
    func backed(text: String) {
        prefectureNameRelay.accept(text)
    }
    
}

extension ViewModel: ViewModelType {
    
    var inputs: ViewModelInput {
        return self
    }
    
    var outputs: ViewModelOutput {
        return self
    }
    
}
