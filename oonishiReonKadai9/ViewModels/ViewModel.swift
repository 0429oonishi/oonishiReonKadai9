//
//  ViewModel.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/11.
//

import RxSwift
import RxCocoa

protocol ViewModelInput {
    func prefectureChoiceButtonDidTapped()
    func backed(text: String)
}

protocol ViewModelOutput: AnyObject {
    var prefectureName: Driver<String> { get }
    var event: Driver<ViewModel.Event> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {
    
    //  ViewControllerに伝えるイベントを定義
    enum Event {
        case presentPrefecturesScreen
    }
    
    private let eventRelay = PublishRelay<Event>()
    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }
    
    // ラベルにバインドする用途で現在地が必要なのでBehavior系を使う
    private let prefectureNameRelay = BehaviorRelay<String>(value: "未選択")
    
    var prefectureName: Driver<String> {
        prefectureNameRelay.asDriver()
    }
    
    func prefectureChoiceButtonDidTapped() {
        eventRelay.accept(.presentPrefecturesScreen)
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
