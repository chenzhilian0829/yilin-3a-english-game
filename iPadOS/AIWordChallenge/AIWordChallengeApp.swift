import SwiftUI

@main
struct AIWordChallengeApp: App {
    @StateObject private var store = GameStore()
    var body: some Scene { WindowGroup { ContentView().environmentObject(store) } }
}
