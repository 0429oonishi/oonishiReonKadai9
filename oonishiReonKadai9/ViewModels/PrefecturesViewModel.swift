//
//  PrefecturesViewModel.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/14.
//

import RxSwift
import RxCocoa

protocol PrefecturesViewModelInput {
    func cancelButtonDidTapped()
    func prefectureButtonDidTapped(index: Int)
}

protocol PrefecturesViewModelOutput: AnyObject {
    var prefectures: [Prefecture] { get }
    var event: Driver<PrefecturesViewModel.Event> { get }
}

protocol PrefecturesViewModelType {
    var inputs: PrefecturesViewModelInput { get }
    var outputs: PrefecturesViewModelOutput { get }
}

final class PrefecturesViewModel: PrefecturesViewModelInput,
                                  PrefecturesViewModelOutput {
    enum Event {
        case dismiss
        case returnSelectedName(String)
    }

    let prefectures: [Prefecture] = Prefecture.data
    
    private let eventRelay = PublishRelay<Event>()
    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }
    
    func cancelButtonDidTapped() {
        eventRelay.accept(.dismiss)
    }
    
    func prefectureButtonDidTapped(index: Int) {
        let name = prefectures[index].name
        eventRelay.accept(.returnSelectedName(name))
        eventRelay.accept(.dismiss)
    }
    
}

extension PrefecturesViewModel: PrefecturesViewModelType {
    
    var inputs: PrefecturesViewModelInput {
        return self
    }
    
    var outputs: PrefecturesViewModelOutput {
        return self
    }
    
}
