import SwiftUI

struct ContentView: View {
    
    @ObservedObject var recentLookupsModel: RecentLookupsModel = RecentLookupsModel()
    
    var body: some View {
        TabView {
            DictionaryLookupView()
                .tabItem {
                    Label("Dictionary", systemImage: "character.book.closed.fill")
                }
            RecentLookupsView()
                .tabItem {
                    Label("Recents", systemImage: "clock.fill")
                }
        }
        .environmentObject(recentLookupsModel)
    }
}
