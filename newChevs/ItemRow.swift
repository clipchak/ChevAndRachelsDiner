//
//  ItemRow.swift
//  newChevs
//
//  Created by Colton Lipchak on 2/7/20.
//  Copyright © 2020 clipchak. All rights reserved.
//
//  formats a menu item
import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.name)
                if(item.additions != ""){
                    Text(item.additions)
                    
                }
            }
            Spacer()
            Text(String(format:"$%.2f", item.price))
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
