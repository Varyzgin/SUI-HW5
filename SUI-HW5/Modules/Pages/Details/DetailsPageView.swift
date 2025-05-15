//
//  Untitled.swift
//  SUI-HW5
//
//  Created by Dim on 10.05.2025.
//

import SwiftUI

struct DetailsPageView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                HStack {
                    Text("Change password")
                        .lineLimit(1)
                        .foregroundStyle(.primary)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.top, 50)
                .padding()
                HStack {
                    Text("Delete all")
                        .lineLimit(1)
                        .foregroundStyle(.primary)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()

                HStack {
                    Text("Location access")
                        .lineLimit(1)
                        .foregroundStyle(.primary)
                        .frame(alignment: .leading)
                    Spacer()
                    Toggle("Location", isOn: .constant(false))
                        .labelsHidden()
                }
                .padding()

            }
            .padding(.horizontal)
//            .scrollIndicators(.visible)
            //                .frame(maxHeight: .infinity)
            
            Text("Settings")
                .lineLimit(1)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        
                .padding(.horizontal)
                .padding(.bottom, 7)
                .background(.ultraThickMaterial)
        }
        .background(.ultraThickMaterial)
    }
}

#Preview {
    DetailsPageView()
}
