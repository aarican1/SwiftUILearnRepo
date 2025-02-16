//
//  ListAndGridButton.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 21.10.2024.
//

import SwiftUI

struct ListAndGridButton: View {
    
    // this variable if is false grid is true is list
    @Binding var isListandGridView : Bool
    var body: some View {
        HStack{
            Spacer()
            Button{
                isListandGridView = !isListandGridView
                print(isListandGridView)
            }label:{
                Image(systemName: !isListandGridView ? "list.bullet" : "square.grid.2x2.fill")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }.padding()
    }
}

#Preview {
    ListAndGridButton(isListandGridView: .constant(false))
}
