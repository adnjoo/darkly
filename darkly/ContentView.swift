//
//  ContentView.swift
//  darkly
//
//  Created by Andrew Njoo on 9/23/24.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    var body: some View {
        VStack {
            if let pdfURL = Bundle.main.url(forResource: "sample", withExtension: "pdf") {
                PDFKitView(url: pdfURL)  // Display the PDF in the app
            } else {
                Text("PDF not found.")
            }
        }
    }
}

struct PDFKitView: NSViewRepresentable {
    var url: URL

    // This function creates the PDFView for the SwiftUI view
    func makeNSView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true  // Automatically scale PDF to fit the view
        return pdfView
    }

    // Update the view when needed (not necessary in this case)
    func updateNSView(_ nsView: PDFView, context: Context) {}
}


#Preview {
    ContentView()
}
