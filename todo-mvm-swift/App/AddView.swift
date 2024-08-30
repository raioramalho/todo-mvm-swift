//
//  AddView.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type something here...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 55)
                .border(.gray)
                .cornerRadius(10)
                
                Button(
                    "Save".uppercased(),
                    action: {
                        alertTitle = " 🔔 - Item added succefull!"
                        showAlert.toggle()
                        listViewModel.addItem(title: textFieldText)
                        presentationMode.wrappedValue.dismiss()
                    }
                )
                .foregroundColor(Color.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(
                    Color.accentColor
                )
                .cornerRadius(10)
                
                
            }
            .padding(14)

        }.navigationTitle("Add an Item 🖋️")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
}

#Preview {
    
    @Previewable @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    NavigationView {
        AddView().environmentObject(listViewModel)
    }

}
