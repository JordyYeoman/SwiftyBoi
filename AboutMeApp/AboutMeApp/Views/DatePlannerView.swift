//
//  DatePlannerView.swift
//  AboutMeApp
//
//  Created by Jordy Yeoman on 29/11/2024.
//

import SwiftUI

struct DatePlannerView: View {
    @StateObject private var eventData = EventData()

       var body: some View {
           WindowGroup {
               NavigationView {
                   EventList()
                   Text("Select an Event")
                       .foregroundStyle(.secondary)
               }
               .environmentObject(eventData)


           }
       }
}

#Preview {
    DatePlannerView()
}
