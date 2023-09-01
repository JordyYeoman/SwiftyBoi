//
//  SmallActivityCard.swift
//  Win
//
//  Created by Jordy Yeoman on 1/9/2023.
//

import SwiftUI

struct SmallActivity {
    let title: String
    let currentValue: String
    let image: String
}

// From apple docs
extension VerticalAlignment {
    /// A custom alignment for image titles.
    private struct ImageTitleAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            // Default to bottom alignment if no guides are set.
            context[VerticalAlignment.bottom]
        }
    }

    /// A guide for aligning titles.
    static let imageTitleAlignmentGuide = VerticalAlignment(
        ImageTitleAlignment.self
    )
}

struct SmallActivityCard: View {
    var activity: SmallActivity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(8)
            
            HStack(alignment: .imageTitleAlignmentGuide) {
                Text(activity.currentValue)
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .alignmentGuide(.imageTitleAlignmentGuide) { context in
                        context[.firstTextBaseline]
                    }
                
                Text(activity.title)
                    .font(.system(size: 16))
                
                Spacer()
                
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: activity.image)
                        .foregroundColor(.blue)
                        .font(.system(size: 32))
                        .opacity(0.5)
                    Text("bpm")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SmallActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallActivityCard(activity: SmallActivity(title: "Heart Rate", currentValue: "120", image: "heart.fill"))
            .frame(height: 80)
    }
}
