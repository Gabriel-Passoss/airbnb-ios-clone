//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Gabriel dos Passos on 28/08/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedSearchOption: DestinationSearchOptions = .location
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var numGuests: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if (!destination.isEmpty) {
                    Button("Clear") {
                        destination = ""
                    }
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            
            // Where Picker
            VStack(alignment: .leading) {
                if (selectedSearchOption == .location) {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add location")
                        .onTapGesture {
                            withAnimation(.snappy) { selectedSearchOption = .location }
                        }
                }
            }
            .modifier(CollapsibleDestinationSearchViewModifier())
            .frame(height: selectedSearchOption == .location ? 120 : 64)
            
            // Date Picker
            VStack(alignment: .leading) {
                if (selectedSearchOption == .dates) {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                        .onTapGesture {
                            withAnimation(.snappy) { selectedSearchOption = .dates }
                        }
                        
                }
            }
            .modifier(CollapsibleDestinationSearchViewModifier())
            .frame(height: selectedSearchOption == .dates ? 180 : 64)
            
            // Guests Picker
            VStack(alignment: .leading) {
                if (selectedSearchOption == .guests) {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                        .onTapGesture {
                            withAnimation(.snappy) { selectedSearchOption = .guests }
                        }
                }
            }
            .modifier(CollapsibleDestinationSearchViewModifier())
            .frame(height: selectedSearchOption == .guests ? 120 : 64)

            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsibleDestinationSearchViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
