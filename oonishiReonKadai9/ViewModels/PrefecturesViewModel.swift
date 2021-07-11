//
//  PrefecturesViewModel.swift
//  oonishiReonKadai9
//
//  Created by akio0911 on 2021/07/12.
//

import RxSwift
import RxRelay

protocol PrefecturesViewModelInput {
    func didTapCancelButton()
    func didTapPrefectureButton(index: Int)
}

protocol PrefecturesViewModelOutput: AnyObject {
    var prefectures: [Prefecture] { get }
    var event: Observable<PrefecturesViewModel.Event> { get }
}

protocol PrefecturesViewModelType {
    var inputs: PrefecturesViewModelInput { get }
    var outputs: PrefecturesViewModelOutput { get }
}

final class PrefecturesViewModel: PrefecturesViewModelInput, PrefecturesViewModelOutput {

    enum Event {
        case dismiss
        case returnSelectedName(String)
    }

    let prefectures: [Prefecture] = Prefecture.data

    private let eventRelay = PublishRelay<Event>()
    var event: Observable<Event> {
        eventRelay.asObservable()
    }

    func didTapCancelButton() {
        eventRelay.accept(.dismiss)
    }

    func didTapPrefectureButton(index: Int) {
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
