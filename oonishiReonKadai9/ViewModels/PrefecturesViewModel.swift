//
//  PrefecturesViewModel.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/14.
//

import RxSwift
import RxCocoa

protocol PrefecturesViewModelInput {
    
}

protocol PrefecturesViewModelOutput: AnyObject {
    
}

protocol PrefecturesViewModelType {
    var inputs: PrefecturesViewModelInput { get }
    var outputs: PrefecturesViewModelOutput { get }
}

final class PrefecturesViewModel: PrefecturesViewModelInput,
                                  PrefecturesViewModelOutput {
    
}

extension PrefecturesViewModel: PrefecturesViewModelType {
    
    var inputs: PrefecturesViewModelInput {
        return self
    }
    
    var outputs: PrefecturesViewModelOutput {
        return self
    }
    
}
