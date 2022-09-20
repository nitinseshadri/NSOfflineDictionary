import SwiftUI
import UIKit

struct DictionaryView: UIViewControllerRepresentable {
    
    @Binding var lookupString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DictionaryView>) -> UIReferenceLibraryViewController {
        let controller = UIReferenceLibraryViewController(term: lookupString)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIReferenceLibraryViewController, context: UIViewControllerRepresentableContext<DictionaryView>) {
        // Nothing to do.
    }
}
