//
//  MultipleChoice.swift
//  Arithmetic
//
//  Created by Ayush Bheemaiah on 2/23/24.
//

import SwiftUI
import AVFoundation

struct MultipleChoice: View {
    
    
    
    @State var firstNum = 0
    @State var secondNum = 0
  
    @State var solution = 0.0
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var numberOfWins = UserDefaults.standard.integer(forKey: "numberOfWins")
    @State var numberOfLosses = UserDefaults.standard.integer(forKey: "numberOfLosses")
    
   
    @State var answerOne = 0.0
    @State var answerTwo = 0.0
    @State var answerThree = 0.0
    @State var answerFour = 0.0
    
    @State var correctCircle = Int.random(in: 0...3)
    @State var timeRemaining = 10
    
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let operation: String
    let digits: Int
    let time: Int
    let symbol: String
    
    
    
    
    init(operation: String, digits: String, time: String) {
        self.operation = operation
        self.digits = Int(digits.prefix(1)) ?? 0;
        self.time = Int(time.prefix(time.count - 1)) ?? 0;
        self.symbol = operation.lowercased()
        self.timeRemaining = self.time
        
        
        
    }
    
    var body: some View {
        
        ZStack {
            
         
            Color.black
                .ignoresSafeArea()
            
            
            
            VStack {
                
                Text("Time: " + String(timeRemaining))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                    
                    .font(.system(size: 50, weight: .bold))
                    
                
                Text(String(numberOfWins) + "/" + String(numberOfLosses + numberOfWins))
                    .foregroundColor(.white)
                
                Text(operation)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.black)
                
                    .frame(width: 300, height: 70)
                    .background(Color.blue)
                    .cornerRadius(25)
                 
                
                
                
                 Text("Multiple Choice")
                 .padding(.top, 5)
                 .font(.system(size: 15, weight: .regular))
                 .foregroundColor(.white)
                 
                 
                if (digits == 1) {
                    Text(String(digits) + " Digit" )
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                } else {
                    Text(String(digits) + " Digits" )
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                }
                 
                 
                
                
                
                HStack {
                    
                    Text(String(firstNum))
                        .font(.system(size: 30, weight: .bold))
                    Image(symbol)
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(String(secondNum))
                        .font(.system(size: 30, weight: .bold))
                }
                
                .padding(.horizontal, 75)
                .padding(.top, 20)
                .padding(.bottom, 20)
                .background(Color.white)
                .cornerRadius(25)
                .frame(minWidth: 230, minHeight: 70)
                
                
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        if correctCircle == 0 {
                            newMath(x: 1)
                        } else {
                            newMath(x: 0)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 120, height: 120)
                                .padding(.bottom, 50)
                                .padding(.top, 50)
                            if (correctCircle == 0) {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            } else {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", answerOne))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", answerOne))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        if correctCircle == 1 {
                            newMath(x: 1)
                        } else {
                            newMath(x: 0)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 120, height: 120)
                                .padding(.bottom, 50)
                                .padding(.top, 50)
                            if (correctCircle == 1) {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                            } else {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", answerTwo))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", answerTwo))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        if correctCircle == 2 {
                            newMath(x: 1)
                        } else {
                            newMath(x: 0)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 120, height: 120)
                            
                            if (correctCircle == 2) {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            } else {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", answerThree))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", answerThree))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        
                        if correctCircle == 3 {
                            newMath(x: 1)
                        } else {
                            newMath(x: 0)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 120, height: 120)
                            
                            if (correctCircle == 3) {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", solution))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            } else {
                                if (operation == "Division") {
                                    Text(String(format: "%.1f", answerFour))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text(String(format: "%.0f", answerFour))
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                                    // Dismiss the current view and navigate back to UserMenu
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Text("Back to Menu")
                                        .font(.system(size: 15, weight: .bold))
                                        .frame(width: 130, height: 35)
                                        .foregroundColor(.black)
                                        
                                        
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        
                                        
                                }
                                
            }
            
            
            
            
          
            
            
        }
        .onAppear {
            numberOfWins = 0
            numberOfLosses = 0
            initializeNumbers()
        
            timeRemaining = time
        }
        
        .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                     
                        newMath(x: 0)
                        // Reset timer
                        self.timeRemaining = time
                    }
                }
        
        
    }
    
    
    func initializeAnswers() {
        
        var num1 = 0;
        var num2 = 0;
        var num3 = 0;
        var num4 = 0;
        var num5 = 0;
        var num6 = 0;
        var num7 = 0;
        var num8 = 0;
        
        if (digits == 1) {
            
            num1 = Int.random(in: 1...9)
            num2 = Int.random(in: 1...9)
            
            
            num3 = Int.random(in: 1...9)
            num4 = Int.random(in: 1...9)
            
            
            num5 = Int.random(in: 1...9)
            num6 = Int.random(in: 1...9)
            
            num7 = Int.random(in: 1...9)
            num8 = Int.random(in: 1...9)
            
            
        }
        else if (digits == 2) {
            
            num1 = Int.random(in: 10...99)
            num2 = Int.random(in: 10...99)
            
            
            num3 = Int.random(in: 10...99)
            num4 = Int.random(in: 10...99)
            
            
            num5 = Int.random(in: 10...99)
            num6 = Int.random(in: 10...99)
            
            num7 = Int.random(in: 10...99)
            num8 = Int.random(in: 10...99)
            
        } else {
            
            num1 = Int.random(in: 100...999)
            num2 = Int.random(in: 100...999)
            
            
            num3 = Int.random(in: 100...999)
            num4 = Int.random(in: 100...999)
            
            
            num5 = Int.random(in: 100...999)
            num6 = Int.random(in: 100...999)
            
            num7 = Int.random(in: 100...999)
            num8 = Int.random(in: 100...999)
        }
        
        if (operation == "Multiplication") {
            
            if (correctCircle == 0) {
                
                answerOne = solution
                answerTwo = Double(num3) * Double(num4) + Double.random(in: 1...5)
                answerThree = Double(num5) * Double(num6) + Double.random(in: 1...5)
                answerFour = Double(num7) * Double(num8) + Double.random(in: 1...5)
            }
            else if (correctCircle == 1) {
                answerTwo = solution
                answerOne = Double(num1) * Double(num2) + Double.random(in: 1...5)
                answerThree = Double(num5) * Double(num6) + Double.random(in: 1...5)
                answerFour = Double(num7) * Double(num8) + Double.random(in: 1...5)
            }
            
            else if (correctCircle == 2) {
                answerThree = solution
                answerOne = Double(num1) * Double(num2) + Double.random(in: 1...5)
                answerTwo = Double(num3) * Double(num4) + Double.random(in: 1...5)
                answerFour = Double(num7) * Double(num8) + Double.random(in: 1...5)
            }
            else {
                answerFour = solution
                answerOne = Double(num1) * Double(num2) + Double.random(in: 1...5)
                answerTwo = Double(num3) * Double(num4) + Double.random(in: 1...5)
                answerThree = Double(num5) * Double(num6) + Double.random(in: 1...5)
            }
            
        
        }
        else if (operation == "Division") {
            
            if (correctCircle == 0) {
                
                answerOne = solution
                answerTwo = Double(num3) / Double(num4) + Double.random(in: 0.1...2)
                answerThree = Double(num5) / Double(num6) + Double.random(in: 0.1...2)
                answerFour = Double(num7) / Double(num8) + Double.random(in: 0.1...2)
            }
            else if (correctCircle == 1) {
                answerTwo = solution
                answerOne = Double(num1) / Double(num2) + Double.random(in: 0.1...2)
                answerThree = Double(num5) / Double(num6) + Double.random(in: 0.1...2)
                answerFour = Double(num7) / Double(num8) + Double.random(in: 0.1...2)
            }
            
            else if (correctCircle == 2) {
                answerThree = solution
                answerOne = Double(num1) / Double(num2) + Double.random(in: 0.1...2)
                answerTwo = Double(num3) / Double(num4) + Double.random(in: 0.1...2)
                answerFour = Double(num7) / Double(num8) + Double.random(in: 0.1...2)
            }
            else {
                answerFour = solution
                answerOne = Double(num1) / Double(num2) + Double.random(in: 0.1...2)
                answerTwo = Double(num3) / Double(num4) + Double.random(in: 0.1...2)
                answerThree = Double(num5) / Double(num6) + Double.random(in: 0.1...2)
            }
        }
        else if (operation == "Subtraction") {
            
            if (correctCircle == 0) {
                
                answerOne = solution
                answerTwo = Double(num3) - Double(num4) + Double.random(in: -5...5)
                answerThree = Double(num5) - Double(num6) + Double.random(in: -5...5)
                answerFour = Double(num7) - Double(num8) + Double.random(in: -5...5)
            }
            else if (correctCircle == 1) {
                answerTwo = solution
                answerOne = Double(num1) - Double(num2) + Double.random(in: -5...5)
                answerThree = Double(num5) - Double(num6) + Double.random(in: -5...5)
                answerFour = Double(num7) - Double(num8) + Double.random(in: -5...5)
            }
            
            else if (correctCircle == 2) {
                answerThree = solution
                answerOne = Double(num1) - Double(num2) + Double.random(in: -5...5)
                answerTwo = Double(num3) - Double(num4) + Double.random(in: -5...5)
                answerFour = Double(num7) - Double(num8) + Double.random(in: -5...5)
            }
            else {
                answerFour = solution
                answerOne = Double(num1) - Double(num2) + Double.random(in: -5...5)
                answerTwo = Double(num3) - Double(num4) + Double.random(in: -5...5)
                answerThree = Double(num5) - Double(num6) + Double.random(in: -5...5)
            }
            
        }
        else {
            
            if (correctCircle == 0) {
                
                answerOne = solution
                answerTwo = Double(num3) + Double(num4) + Double.random(in: 2...6)
                answerThree = Double(num5) + Double(num6) + Double.random(in: 2...6)
                answerFour = Double(num7) + Double(num8) + Double.random(in: 2...6)
            }
            
            else if (correctCircle == 1) {
                answerTwo = solution
                answerOne = Double(num1) + Double(num2) + Double.random(in: 2...6)
                answerThree = Double(num5) + Double(num6) + Double.random(in: 2...6)
                answerFour = Double(num7) + Double(num8) + Double.random(in: 2...6)
            }
            
            else if (correctCircle == 2) {
                answerThree = solution
                answerOne = Double(num1) + Double(num2) + Double.random(in: 2...6)
                answerTwo = Double(num3) + Double(num4) + Double.random(in: 2...6)
                answerFour = Double(num7) + Double(num8) + Double.random(in: 2...6)
            }
            else {
                answerFour = solution
                answerOne = Double(num1) + Double(num2) + Double.random(in: 2...6)
                answerTwo = Double(num3) + Double(num4) + Double.random(in: 2...6)
                answerThree = Double(num5) + Double(num6) + Double.random(in: 2...6)
            }
            
        }
    }
    func initializeNumbers() {
        
        initializeAnswers()
        
        correctCircle = Int.random(in: 0...3)
        
        if (digits == 1) {
            
            firstNum = Int.random(in: 1...9)
            if (operation == "Division") {
                secondNum = Int.random(in: 1...firstNum)
            } else {
                secondNum = Int.random(in: 1...9)
            }
            
        }
        else if (digits == 2) {
            
            firstNum = Int.random(in: 10...99)
            if (operation == "Division") {
                secondNum = Int.random(in: 1...firstNum)
            } else {
                secondNum = Int.random(in: 10...99)
            }
            
        } else {
            
            firstNum = Int.random(in: 100...999)
            if (operation == "Division") {
                secondNum = Int.random(in: 100...firstNum)
            } else {
                secondNum = Int.random(in: 100...999)
            }
        }
        
        if (operation == "Multiplication") {
            solution = Double(firstNum) * Double(secondNum)
        }
        else if (operation == "Division") {
            solution = Double(firstNum) / Double(secondNum)
        }
        else if (operation == "Subtraction") {
            solution = Double(firstNum) - Double(secondNum)
        }
        else {
            solution = Double(firstNum) + Double(secondNum)
        }
        
        
    }
    
    func newMath (x: Int) {
        if x == 1 {
            numberOfWins += 1
            
        } else {
            numberOfLosses += 1
          
        }
        timeRemaining = time
        initializeNumbers()
    }
}
    

#Preview {
    MultipleChoice(operation: "Multiplication", digits: "2 Digit", time: "30s")
}
