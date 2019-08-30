//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Marcos Lacerda on 30/08/19.
//  Copyright © 2019 Marcos Lacerda. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  let rTarget = Double.random(in: 0..<1)
  let gTarget = Double.random(in: 0..<1)
  let bTarget = Double.random(in: 0..<1)
  
  @State var rGuess: Double
  @State var gGuess: Double
  @State var bGuess: Double
  @State var showAlert = false
  
  func computeScore() -> Int {
    let rDiff = rGuess - rTarget
    let gDiff = gGuess - gTarget
    let bDiff = bGuess - bTarget

    let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
    
    return Int((1.0 - diff) * 100 + 0.5)
  }
  
    var body: some View {
      VStack {
        HStack {
          Text("Target Color Block")
          Text("Guess Color Block")
        }
        
        HStack {
          // Target block
          VStack {
            Rectangle().foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
            Text("Match this color")
          }
          
          // Guess block
          VStack {
            Rectangle().foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
            
            HStack {
              Text("R: \(Int(rGuess * 255.0))")
              Text("G: \(Int(gGuess * 255.0))")
              Text("B: \(Int(bGuess * 255.0))")
            }
          }
        }
        
        Button(action: {
          self.showAlert = true
        }) {
          Text("Hit Me!")
        }
        .presentation($showAlert) { () -> Alert in
            Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
        }
        
        VStack {
          ColorSlider(value: $rGuess, textColor: .red)
          ColorSlider(value: $gGuess, textColor: .green)
          ColorSlider(value: $bGuess, textColor: .blue)
        }
      }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
      ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
#endif
