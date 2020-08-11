//
//  ToolBarView.swift
//  SimpleDrawing
//
//  Created by Chatharoo on 11/08/2020.
//  Copyright © 2020 Chatharoo. All rights reserved.
//

import SwiftUI
import PencilKit

enum ActiveSheet {
    case color
    case inkType
}

struct ToolBarView: View {
    @Binding var canvasView: PKCanvasView
    @Binding var show: Bool
    @Binding var color: UIColor
    @Binding var activeSheet: ActiveSheet

    var body: some View {
        ZStack {
            Rectangle()
            .frame(width: 200, height: 100)
            .cornerRadius(15)
            .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                Button(action: {
                    self.show.toggle()
                    self.activeSheet = .color
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(color))
                            .frame(width: 50, height: 50)
                        
                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 50, height: 50)
                    }
                }
                
                Button(action: {
                    self.show.toggle()
                    self.activeSheet = .inkType
                }) {
                    ZStack {
                        Image(systemName: "hand.draw")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.black)
                    }
                }
                
                Button(action: {
                    self.canvasView.drawing = PKDrawing()
                }) {
                    Image(systemName: "clear")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
