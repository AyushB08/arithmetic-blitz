import SwiftUI


struct UserMenu: View {
    
    let operations = ["Addition", "Subtraction", "Multiplication", "Division"]
    let digits = ["1 Digit", "2 Digits",  "3 Digits"]
    let mode = ["Multiple Choice", "User Input"]
    let timer = ["5s", "10s", "30s", "60s", "120s", "300s"]
    
    @State var selectedDigits = 0
    @State var selectedOperation = 2
    @State var selectedMode = 0
    @State var selectedTime = 2
   
    
    @State var isGoButtonPressed = false
    @State var multipleChoiceSwitch = false
    @State var userInputSwitch = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                
                
                VStack(alignment: .center) {
                    Text("Arithmetic Practice")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: 300, height: 100)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(25)
                        .padding()
                    
                    VStack {
                        HStack {
                            Text("Operation:")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 100) // Fixed width for the label
                            Picker(selection: $selectedOperation, label: Text("Select an option")) {
                                ForEach(0 ..< operations.count, id: \.self) { index in
                                    Text(self.operations[index])
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 170)
                        }
                        
                        HStack {
                            Text("Difficulty:")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 100)
                            Picker(selection: $selectedDigits, label: Text("Select an option")) {
                                ForEach(0 ..< digits.count, id: \.self) { index in
                                    Text(self.digits[index])
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 170)
                        }
                        
                        HStack {
                            Text("Mode:")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 100)
                            Picker(selection: $selectedMode, label: Text("Select an option")) {
                                ForEach(0 ..< mode.count, id: \.self) { index in
                                    Text(self.mode[index])
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 170)
                        }
                        
                        HStack {
                            
                            Text("Timer:")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 100)
                            Picker(selection: $selectedTime, label: Text("Select an option")) {
                                ForEach(0 ..< timer.count, id: \.self) { index in
                                    Text(self.timer[index])
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 170)
                        }
                    }
                    .padding()
                    .border(Color.white)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 300)
                    
                   
                    if (selectedMode == 1 && selectedOperation == 3) {
                        Text("Round to the nearest tenth if the quotient is a decimal")
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 20)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: {
                        if (selectedMode == 0) {
                            multipleChoiceSwitch = true;
                        } else {
                            userInputSwitch = true;
                        }
                    }) {
                        Text("GO")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.black)
                            .frame(width: 100, height: 60)
                            .background(Color.blue)
                            .multilineTextAlignment(.center)
                            .cornerRadius(25)
                            .padding()
                    }
                    
                    .fullScreenCover(isPresented: $multipleChoiceSwitch) {
                                        MultipleChoice(operation: operations[selectedOperation],
                                                       digits: digits[selectedDigits],
                                                       time: timer[selectedTime])
                                    }
                    
                    .fullScreenCover(isPresented: $userInputSwitch) {
                                        UserInput(operation: operations[selectedOperation],
                                                       digits: digits[selectedDigits],
                                                       time: timer[selectedTime])
                                    }
                

                     
                    
                    



                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    UserMenu()
}
