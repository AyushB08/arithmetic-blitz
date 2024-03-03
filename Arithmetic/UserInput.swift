//
//  UserInput.swift
//  Arithmetic
//
//  Created by Ayush Bheemaiah on 2/23/24.
//

import SwiftUI

struct UserInput: View {
    
    @State var numberOfWins = UserDefaults.standard.integer(forKey: "numberOfWins")
    @State var numberOfLosses = UserDefaults.standard.integer(forKey: "numberOfLosses")
    
    @State var timeRemaining = 10
    
    @State var firstNum = 0
    @State var secondNum = 0
    
    @State var solution = 0.0
    @State var userInput = ""
    
    @State var feedbackAlert = false
    @State var submissionAlertCorrect = false;
    @State var submissionAlertWrong = false;
    
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
                    .padding(.top, 80)
                    .font(.system(size: 50, weight: .bold))
                
                
                Text(String(numberOfWins) + "/" + String(numberOfLosses + numberOfWins))
                    .foregroundColor(.white)
                
                Text(operation)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.black)
                
                    .frame(width: 300, height: 70)
                    .background(Color.blue)
                    .cornerRadius(25)
                
                
                
                
                Text("User Input")
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
                .padding(.bottom, 40)
                TextField("Enter your answer", text: $userInput)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .frame(width: 300, height: 50)
                
                Button("Submit") {
                    
                    if let userAnswer = Double(userInput) {
                        if String(format: "%.1f", userAnswer) == String(format: "%.1f", solution) {
                        
                            newMath(x: 1)
                        } else {
                            newMath(x: 0)
                        }
                        
                        userInput = ""
                        
                    
                    } else {
                        feedbackAlert = true
                    }
                }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
                
                if (feedbackAlert) {
                    Text("Please only use numbers.")
                        .foregroundColor(.white)
                       
                        .background(Color.black)
                        .cornerRadius(10)
                        .onAppear {
                            
                            submissionAlertWrong = false
                            submissionAlertCorrect = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                feedbackAlert = false
                            }
                        }
                }
                
                if (submissionAlertCorrect) {
                    
                    Text("Correct!")
                        .foregroundColor(.white)
                        
                        .background(Color.black)
                        .cornerRadius(10)
                        .onAppear {
                            submissionAlertWrong = false
                            feedbackAlert = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                submissionAlertCorrect = false
                            }
                       
                        }
                }
                
                if (submissionAlertWrong) {
                
                    Text("Wrong!")
                        .foregroundColor(.white)
                      
                        .background(Color.black)
                        .cornerRadius(10)
                        .onAppear {
                            submissionAlertCorrect = false
                            feedbackAlert = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                submissionAlertWrong = false
                            }
                       
                        }
                }
                
                
                Spacer()
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
              
                self.timeRemaining = time
            }
        }
    }
    
    func initializeNumbers() {
    
        
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
            solution = ((Double)(firstNum ) * ((Double)(secondNum)))
        }
        
        if (operation == "Division") {
            solution = ((Double)(firstNum ) / ((Double)(secondNum)))
        }
        if (operation == "Subtraction") {
            solution = ((Double)(firstNum) - ((Double)(secondNum)))
        }
        if (operation == "Addition") {
            solution = ((Double)(firstNum) + ((Double)(secondNum)))
        }
        
    }
    
    func newMath (x: Int) {
        if (x == 1) {
            submissionAlertCorrect = true;
            submissionAlertWrong = false;
            numberOfWins += 1;
            
            initializeNumbers();
        } else {
            numberOfLosses += 1;
            
            submissionAlertWrong = true;
            submissionAlertCorrect = false;
            
        }
        
        timeRemaining = self.time
        
    }
}


#Preview {
    UserInput(operation: "Division", digits: "1 digits", time: "30s")
    
}
