//
//  ActivityCard.swift
//  Win
//
//  Created by Jordy Yeoman on 27/8/2023.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subTitle: String
    let image: String
    let amount: String
    let percentComplete: String
}

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(8)
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subTitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        Image(systemName: activity.image)
                            .foregroundColor(.green)
                        Text("\(activity.percentComplete)%")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                
                Text(activity.amount)
                    .font(.system(size: 24))
                    .padding(.top, 5)
            }
            .padding()
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10,000", image: "figure.walk", amount: "6,543", percentComplete: "\((6543/10000) * 100)"))
    }
}
