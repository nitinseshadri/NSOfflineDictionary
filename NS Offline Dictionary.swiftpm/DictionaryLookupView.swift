import SwiftUI

struct DictionaryLookupView: View {
    
    @State private var lookupString: String = ""
    
    @State private var showDictionarySheet: Bool = false
    
    @EnvironmentObject var recentLookupsModel: RecentLookupsModel
    
    private func lookupInDictionary() {
        showDictionarySheet = true
        recentLookupsModel.items.insert(lookupString, at: 0)
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "character.book.closed.fill")
                Text("Dictionary")
                    .bold()
                Spacer()
            }
            .font(.largeTitle)
            .accessibilityHidden(true)
                
            HStack {
                TextField("Search", text: $lookupString)
                    .font(.title2)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.search)
                    .onSubmit {
                        if (!lookupString.isEmpty) {
                            lookupInDictionary()
                        }
                    }
                
                Button(action: {
                    lookupInDictionary()
                }) {
                    Image(systemName: "arrow.forward.circle.fill")
                        .font(.title)
                }
                .disabled(lookupString.isEmpty)
                .accessibilityLabel("Search")
            }
            .padding()
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(radius: 2)
            .frame(maxWidth: 512)
            .padding()
            
            Text("Manage dictionaries in Settings > General > Dictionary.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .accessibilityLabel("Manage dictionaries in Settings, General, Dictionary.")
            
            Spacer()
            
        }
        .sheet(isPresented: $showDictionarySheet) {
            DictionaryView(lookupString: $lookupString)
                .ignoresSafeArea()
        }
    }
}
