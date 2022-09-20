import Foundation
import Combine

class RecentLookupsModel: NSObject, ObservableObject {
    
    @Published public var items: [String] = ["ingenuity", "perseverance", "curiosity", "opportunity", "spirit", "sojourner", "insight", "phoenix", "pathfinder", "viking"]
    
}
