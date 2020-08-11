//
//  CanvasView.swift
//  SimpleDrawing
//
//  Created by Chatharoo on 11/08/2020.
//  Copyright © 2020 Chatharoo. All rights reserved.
//

import SwiftUI
import PencilKit


struct Canvas: UIViewRepresentable {
    @State var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.allowsFingerDrawing = true
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}
