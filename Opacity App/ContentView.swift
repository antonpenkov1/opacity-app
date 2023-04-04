//
//  ContentView.swift
//  Opacity App
//
//  Created by Антон Пеньков on 04.04.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var animate = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack {
                    Group {
                        Text("Text capsules")
                            .bold()
                            .padding()
                            .background(.purple.opacity(0.2), in: Capsule())
                        
                        Text("appear on tap")
                            .bold()
                            .padding()
                            .background(.purple.opacity(0.2), in: Capsule())
                    }
                    .opacity(animate ? 1.0 : 0.0)
                    ZStack{
                        Image("soir_blue")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 200, height: 200)
                            .clipped()
                            .cornerRadius(30)
                        Text("Tap me!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    Group {
                        Text("And disappear")
                            .bold()
                            .padding()
                            .background(.purple.opacity(0.2), in: Capsule())
                        
                        Text("the same way")
                            .bold()
                            .padding()
                            .background(.purple.opacity(0.2), in: Capsule())
                    }
                    .opacity(animate ? 1.0 : 0.0)
                    
                }
                .onTapGesture {
                    withAnimation(Animation.spring().speed(0.5)) {
                        animate.toggle()
                    }
                }
                .frame(minWidth: 1000, minHeight: 1000)
                
                NavigationLink(destination: BasicBottomSheet())
                {
                    Text("Tap")
                        .font(.headline)
                }
                .padding(15)
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(50)
                .padding(30)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 4, y: 4)
                .offset(x: 120, y: 300)
            }
        }
            
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
