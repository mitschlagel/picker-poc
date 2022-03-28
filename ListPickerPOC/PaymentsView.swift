//
//  ContentView.swift
//  ListPickerPOC
//
//  Created by Spencer Jones on 3/27/22.
//

import SwiftUI

class PayFromAccount: Identifiable {
    
    
    var id: UUID = UUID()
    var name: String = ""
    var number: String = ""
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
}

class PayToAccount: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var number: String = ""
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
}



struct PaymentsView: View {
    
    @StateObject private var viewModel = PaymentsViewModel()
    
    var body: some View {
        NavigationView {
            SelectAccounts()
        }
    }
}



func SelectAccounts() -> some View {
    
    let accounts: [PayFromAccount] = [PayFromAccount(name: "fnbo", number: "1234"), PayFromAccount(name: "other", number: "7890") ]
    @State var selectedFromAccount = accounts[1].id.uuidString
    @State var selectedToAccount = accounts[0].id.uuidString
    
    let row =
    List {
        Section {
            Picker(selection: $selectedFromAccount, label: Text("From")) {
                ForEach(accounts, id: \.id.uuidString) { account in
                    
                    VStack {
                        Text(account.name)
                        Text(account.number)
                    }
                    
                }
            }
            Picker(selection: $selectedToAccount, label: Text("To")) {
                ForEach(accounts, id: \.id.uuidString) { account in
                    
                    VStack {
                        Text(account.name)
                        Text(account.number)
                    }
                    
                }
            }
        
        }
    }.listStyle(.grouped)
    
    return row
}

//func SelectPayToAccount() -> some View {
//    let accounts: [PayFromAccount] = [PayFromAccount(name: "foo", number: "4567"), PayFromAccount(name: "bar", number: "2316") ]
//
//
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsView()
    }
}


