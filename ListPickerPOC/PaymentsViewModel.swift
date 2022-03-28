//
//  PaymentsViewModel.swift
//  ListPickerPOC
//
//  Created by Spencer Jones on 3/27/22.
//

import Foundation
import SwiftUI

class PaymentsViewModel: ObservableObject {
    @Published private(set) var name: String
    @Published private(set) var number: String
    
    init() {
        self.name = "TEST ACCOUNT"
        self.number = "1234"
    }
    
}
