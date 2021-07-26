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
            ZStack {
                Canvas(canvasView: canvasView, selectedColor: $color)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            ToolBarView(canvasView: $canvasView, show: $show, color: $color, activeSheet: $activeSheet)
                                .actionSheet(isPresented: $show) {
                                    if self.activeSheet == .color {
                                        return ActionSheet(title: Text("Select a color"),
                                                           message: nil,
                                                           buttons: [
                                                            .default(
                                                                Text("⚫"), action:  { self.color = .black }),
                                                            .default(Text("🔴"), action:  { color = .systemRed }),
                                                            .default(Text("Pink"), action:  { self.color = .systemPink }),
                                                            .default(Text("🟠"), action:  { self.color = .systemOrange }),
                                                            .default(Text("🟡"), action:  { self.color = .systemYellow }),
                                                            .default(Text("🟢"), action:  { self.color = .systemGreen }),
                                                            .default(Text("Indigo"), action:  { self.color = .systemIndigo }),
                                                            .default(Text("🔵"), action:  { self.color = .systemBlue }),
                                                            .default(Text("⚪"), action:  { self.color = .white }),
                                                            .cancel()
                                        ])
                                    } else {
                                        return ActionSheet(title: Text("Select a type"),
                                                           message: nil,
                                                           buttons: [
                                                            .default(Text("🖋️ pen"), action:  { self.canvasView.tool = PKInkingTool(.pen, color: self.color, width: 15) }),
                                                            .default(Text("🖊️ marker"), action:  { self.canvasView.tool = PKInkingTool(.marker, color: self.color, width: 15) }),
                                                            .default(Text("✏️ pencil"), action:  { self.canvasView.tool = PKInkingTool(.pencil, color: self.color, width: 15) }),
                                                            .cancel()
                                        ])
                                    }
                        }
                    }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
                
            ToolBarView(canvasView: $canvasView, show: $show, color: $color, activeSheet: $activeSheet)
                .actionSheet(isPresented: $show) {
                    if self.activeSheet == .color {
                        return ActionSheet(title: Text("Select a color"),
                                           message: nil,
                                           buttons: [
                                            .default(
                                                Text("⚫"), action:  { self.color = .black }),
                                            .default(Text("🔴"), action:  { color = .systemRed }),
                                            .default(Text("Pink"), action:  { self.color = .systemPink }),
                                            .default(Text("🟠"), action:  { self.color = .systemOrange }),
                                            .default(Text("🟡"), action:  { self.color = .systemYellow }),
                                            .default(Text("🟢"), action:  { self.color = .systemGreen }),
                                            .default(Text("Indigo"), action:  { self.color = .systemIndigo }),
                                            .default(Text("🔵"), action:  { self.color = .systemBlue }),
                                            .default(Text("⚪"), action:  { self.color = .white }),
                                            .cancel()
                        ])
                    } else {
                        return ActionSheet(title: Text("Select a type"),
                                           message: nil,
                                           buttons: [
                                            .default(Text("🖋️ pen"), action:  { self.canvasView.tool = PKInkingTool(.pen, color: self.color, width: 15) }),
                                            .default(Text("🖊️ marker"), action:  { self.canvasView.tool = PKInkingTool(.marker, color: self.color, width: 15) }),
                                            .default(Text("✏️ pencil"), action:  { self.canvasView.tool = PKInkingTool(.pencil, color: self.color, width: 15) }),
                                            .cancel()
                        ])
                    }
            }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .bottom)
            }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
