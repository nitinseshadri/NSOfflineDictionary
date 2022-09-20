import SwiftUI

struct RecentLookupsView: View {
    
    @Environment(\.editMode) private var editMode
    
    @State private var lookupString: String = ""
    
    @State private var showDictionarySheet: Bool = false
    
    @EnvironmentObject var recentLookupsModel: RecentLookupsModel
    
    private func lookupInDictionary(string: String) {
        lookupString = string
        showDictionarySheet = true
    }
    
    @State var showClearAllRecentsConfirmationDialog: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recentLookupsModel.items, id: \.self) { recentLookup in
                    Button(action: {
                        lookupInDictionary(string: recentLookup)
                    }) {
                        HStack {
                            Text(recentLookup)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text(Image(systemName: "arrow.up.backward"))
                                .bold()
                                .accessibilityHidden(true)
                        }
                    }
                    .accessibilityHint("Tap to search for “\(recentLookup)” in the dictionary.")
                }
                .onDelete { offsets in
                    recentLookupsModel.items.remove(atOffsets: offsets)
                }
            }
            .overlay(
                Text("No Recents")
                    .font(.title)
                    .foregroundColor(.gray)
                    .opacity(recentLookupsModel.items.isEmpty ? 1.0 : 0.0)
            )
            .toolbar {
                EditButton()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear") {
                        showClearAllRecentsConfirmationDialog = true
                    }
                    .confirmationDialog("Are you sure you want to clear all recents?", isPresented: $showClearAllRecentsConfirmationDialog) {
                        Button("Clear All Recents", role: .destructive) {
                            recentLookupsModel.items = []
                        }
                        Button("Cancel", role: .cancel) {
                            showClearAllRecentsConfirmationDialog = false
                        }
                    }
                }
            }
            .navigationTitle("Recents")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showDictionarySheet) {   
            DictionaryView(lookupString: $lookupString)
                .ignoresSafeArea()
        }
    }
}
