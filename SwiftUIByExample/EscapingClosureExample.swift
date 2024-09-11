//
//  EscapingClosureExample.swift
//  SwiftUIByExample
//
//  Created by Jiten Patel on 11/09/24.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadDataFromInternet { [weak self] data in
            self?.text = data
        }
    }
    
    func downloadData() -> String {
        return "New Data"
    }
    
    func downloadDataFromInternet(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            return completionHandler("Downloaded data from Internet")
        }
    }
    
}

struct EscapingClosureExample: View {
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        vm.getData()
                    }
    }
}

#Preview {
    EscapingClosureExample()
}
