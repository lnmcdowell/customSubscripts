//
//  ContentView.swift
//  customSubscripts
//
//  Created by Nathaniel Mcdowell on 10/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var checkerboard = Checkerboard()
    
    @State var showSheet:Bool = false
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                print(checkerboard)
            }
        Button("Show"){
            showSheet = true
            let coordinate = (x: 3, y: 2)
            checkerboard[coordinate] = Square.white
            print(checkerboard)
        }.sheet(isPresented: $showSheet, onDismiss: {print("Dismissed")}, content: {
            DetailView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DetailView:View {
    var body: some View {
        Text("The detail!")
    }
}
