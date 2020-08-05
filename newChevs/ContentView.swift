//
//  ContentView.swift
//  newChevs
//
//  Created by Colton Lipchak on 2/5/20.
//  Copyright © 2020 clipchak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var bfastPresented = false
    @State var lunchPresented = false
    @State var hoursPresented = false

    //presents the view of the breakfast menu
    struct BreakfastView: View {
        @Environment(\.presentationMode) var presentationMode
        let menu = Bundle.main.decode([MenuSection].self, from: "breakfastMenu.json")
        
        var body: some View {
            NavigationView{
                List{
                    ForEach(menu){ section in
                        Section(header: Text(section.name)){
                            ForEach(section.items){item in
                                ItemRow(item: item)
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Breakfast"))
                .listStyle(GroupedListStyle())
                .navigationBarItems(trailing:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        Text("Done")
                })
                
            }
        }
        
    }
    //presents the view of the lunch menu
    struct LunchView: View {
        @Environment(\.presentationMode) var presentationMode
        let menu = Bundle.main.decode([MenuSection].self, from: "lunchMenu.json")
        
        var body: some View {
            NavigationView{
                List{
                    ForEach(menu){ section in
                        Section(header: Text(section.name)){
                            ForEach(section.items){item in
                                ItemRow(item: item)
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Lunch"))
                .listStyle(GroupedListStyle())
                .navigationBarItems(trailing:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        Text("Done")
                })
                
            }
        }
    }
    //presents the view of the hours of operation
    struct HoursView: View {
         @Environment(\.presentationMode) var presentationMode
         let menu = Bundle.main.decode([MenuSection].self, from: "lunchMenu.json")
         
         var body: some View {
             NavigationView{
                VStack{
                    HStack{
                        Text("Monday")
                        Spacer()
                        Text("Closed")
                    }
                    HStack{
                        Text("Tuesday")
                        Spacer()
                        Text("7AM - 1:30PM")
                    }
                    HStack{
                        Text("Wednesday")
                        Spacer()
                        Text("7AM - 1:30PM")
                    }
                    HStack{
                        Text("Thursday")
                        Spacer()
                        Text("7AM - 1:30PM")
                    }
                    HStack{
                        Text("Friday")
                        Spacer()
                        Text("7AM - 1:30PM")
                    }
                    HStack{
                        Text("Saturday")
                        Spacer()
                        Text("7AM - 1:00PM")
                    }
                    HStack{
                        Text("Sunday")
                        Spacer()
                        Text("7AM - 1:00PM")
                    }
                
                }
                .offset(y:-160)
                    .padding(20)
                 .navigationBarTitle(Text("Hours"))
                 .listStyle(GroupedListStyle())
                 .navigationBarItems(trailing:
                     Button(action: {
                         self.presentationMode.wrappedValue.dismiss()
                     })
                     {
                         Text("Done")
                 })
             }
            
         }
     }
    
    //the view of the content of the app
    var body: some View {

        VStack(alignment: .center){
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height:UIScreen.main.bounds.height/3.5)
            
            //stack for fb and phone buttons
            HStack {
                Button(action: {
                    let strUrl = "https://www.facebook.com/ChevandRachel/"
                    let url = URL(string: strUrl)!
                    UIApplication.shared.open(url)
                    }) {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55,height:55)
                    }
                
                Spacer()
                CircleImage()
                    .offset(y:-30)

                Spacer()
                
                Button(action: {
                    let strNumber = "tel://412-732-0140"
                    let url = URL(string: strNumber)!
                    UIApplication.shared.open(url)
                    }) {
                        Image("phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45,height:45)
                    }
                  
            } .padding(18)
            .offset(y:-90)
            
            //stack for menus
            VStack{
                Button(action: {
                    self.bfastPresented = true
                    
                    })
                {
                    Text("Breakfast Menu")
                        .font(.system(size: 28))
                        .foregroundColor(Color.black)
                        .fontWeight(.medium)

                }.sheet(isPresented: self.$bfastPresented){
                    BreakfastView()
                }
                
                Spacer()
                Spacer()
                Spacer()
                    
                Button(action: {
                    self.lunchPresented = true
                        
                })
                {
                    Text("Lunch Menu")
                        .font(.system(size: 28))
                        .foregroundColor(Color.black)
                        .fontWeight(.medium)


                }.sheet(isPresented: self.$lunchPresented){
                    LunchView()
                }
                
                Spacer()
                Spacer()
                Spacer()

                Button(action: {
                    self.hoursPresented = true
                        
                })
                {

                    Text("Hours")
                        .font(.system(size: 28))
                        .foregroundColor(Color.black)
                        .fontWeight(.medium)


                }.sheet(isPresented: self.$hoursPresented){
                    HoursView()
                }
                Spacer()
            }.offset(y:-80)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

