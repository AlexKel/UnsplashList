//
//  ErrorView.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import SwiftUI

struct ErrorView: View {
    typealias RetryHandler = () -> Void
    
    let error: Error
    let retryHandler: RetryHandler?
    
    init(error: Error, retryHandler: RetryHandler? = nil) {
        self.error = error
        self.retryHandler = retryHandler
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Ooops!").font(.title).padding(.bottom, 10)
            
            if let retryHandler {
                Button(action: retryHandler) {
                    HStack {
                        Text("Retry")
                        Image(systemName: "arrow.counterclockwise.circle")
                    }
                }
            }
            Text(error.localizedDescription).font(.title2).foregroundColor(.red).padding(.top, 20)
        }.padding(.vertical, 20)
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let error: Error = "Test error"
        ErrorView(error: error) {
            print("retry!")
        }
    }
}
