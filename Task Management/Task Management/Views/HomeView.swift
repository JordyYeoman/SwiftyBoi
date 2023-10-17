//
//  HomeView.swift
//  Task Management
//
//  Created by Jordy Yeoman on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HeaderView()
            
            TabView(selection: $currentWeekIndex {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
        })
        .vSpacing(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
