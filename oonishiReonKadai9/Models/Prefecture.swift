//
//  Prefecture.swift
//  oonishiReonKadai9
//
//  Created by 大西玲音 on 2021/07/10.
//

import Foundation

struct Prefecture {
    let name: String
}

extension Prefecture {
    static let data = [Prefecture(name: "東京都"),
                       Prefecture(name: "神奈川県"),
                       Prefecture(name: "埼玉県"),
                       Prefecture(name: "千葉県")]
}
