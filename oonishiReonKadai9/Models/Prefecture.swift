//
//  Prefecture.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import Foundation

struct Prefecture {
    let name: String
    let id: Int
}

extension Prefecture {
    static let data = [Prefecture(name: "東京都", id: 0),
                       Prefecture(name: "神奈川県", id: 1),
                       Prefecture(name: "埼玉県", id: 2),
                       Prefecture(name: "千葉県", id: 3)]
}
