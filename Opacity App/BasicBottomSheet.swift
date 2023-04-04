//
//  BasicBottomSheet.swift
//  Opacity App
//
//  Created by Антон Пеньков on 04.04.2023.
//

import SwiftUI

struct BasicBottomSheet: View {
    @State private var showSheet = false
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        ZStack {
            Image("soir_blue")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Section {
                    Button("Show Bottom Sheet") {
                        showSheet.toggle()
                    }
                    .font(.headline)
                    .frame(width: 200, height: 60, alignment: .center)
                    .background(.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(20)
    //                .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSheet) {
                        Text("This is the expandable bottom sheet.")
                            .presentationDetents([.fraction(0.2), .medium, .large], selection: $selectedDetent)
        //                    .presentationDragIndicator(.hidden)
                            .presentationBackground(.thinMaterial)
                            .presentationCornerRadius(100)
                            .presentationBackgroundInteraction(.enabled)
                        
                    }
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            
            }
        }
        .navigationTitle("Soir Blue")
        .navigationBarTitleDisplayMode(.large)
        .navigationSplitViewColumnWidth(50)
        
    }
}

struct BasicBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BasicBottomSheet()
    }
}
