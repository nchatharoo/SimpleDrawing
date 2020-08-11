//
//  ContentView.swift
//  SimpleDrawing
//
//  Created by Chatharoo on 11/08/2020.
//  Copyright © 2020 Chatharoo. All rights reserved.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var canvasView = PKCanvasView()
    @State private var show = false
    @State private var activeSheet: ActiveSheet = .color
    @State private var color: UIColor = .black
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                Canvas(canvasView: canvasView)
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 200)
            Spacer()
            ToolBarView(canvasView: $canvasView, show: $show, color: $color, activeSheet: $activeSheet)
                .actionSheet(isPresented: $show) {
                    if self.activeSheet == .color {
                        return ActionSheet(title: Text("Select a color"),
                                           message: nil,
                                           buttons: [
                                            .default(Text("Black"), action:  { self.color = .black }),
                                            .default(Text("Red"), action:  { self.color = .systemRed }),
                                            .default(Text("Pink"), action:  { self.color = .systemPink }),
                                            .default(Text("Orange"), action:  { self.color = .systemOrange }),
                                            .default(Text("Yellow"), action:  { self.color = .systemYellow }),
                                            .default(Text("Green"), action:  { self.color = .systemGreen }),
                                            .default(Text("Indigo"), action:  { self.color = .systemIndigo }),
                                            .default(Text("Blue"), action:  { self.color = .systemBlue }),
                                            .default(Text("White"), action:  { self.color = .white }),
                                            .cancel()
                        ])
                    } else {
                        return ActionSheet(title: Text("Select a type"),
                                           message: nil,
                                           buttons: [
                                            .default(Text("Pen"), action:  { self.canvasView.tool = PKInkingTool(.pen, color: self.color, width: 15) }),
                                            .default(Text("Marker"), action:  { self.canvasView.tool = PKInkingTool(.marker, color: self.color, width: 15) }),
                                            .default(Text("Pencil"), action:  { self.canvasView.tool = PKInkingTool(.pencil, color: self.color, width: 15) }),
                                            .cancel()
                        ])
                    }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
