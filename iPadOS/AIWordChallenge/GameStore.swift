import Foundation
import AVFoundation
import AudioToolbox

struct Word: Codable, Identifiable, Hashable { var id: String { english }; let english: String; let chinese: String; let category: String; let audio: String? }
final class GameStore: ObservableObject {
    @Published var words: [Word] = []
    @Published var wrong = Set<String>(); @Published var unlocked = 1; @Published var points = 0
    private let speech = AVSpeechSynthesizer(); private let defaults = UserDefaults.standard
    init() { if let url = Bundle.main.url(forResource: "wordbank", withExtension: "json"), let data = try? Data(contentsOf: url), let value = try? JSONDecoder().decode([Word].self, from: data) { words = value }; wrong = Set(defaults.stringArray(forKey: "wrong") ?? []); unlocked = max(1, defaults.integer(forKey: "unlocked")); points = defaults.integer(forKey: "points") }
    var levels: [[Word]] { stride(from: 0, to: words.count - 19, by: 20).map { Array(words[$0..<$0 + 20]) } }
    func save() { defaults.set(Array(wrong), forKey: "wrong"); defaults.set(unlocked, forKey: "unlocked"); defaults.set(points, forKey: "points") }
    func speak(_ word: String) { let u = AVSpeechUtterance(string: word); u.voice = AVSpeechSynthesisVoice(language: "en-US"); u.rate = 0.42; speech.stopSpeaking(at: .immediate); speech.speak(u) }
    func click() { AudioServicesPlaySystemSound(1104) }
    func finish(level: Int, correct: Int) { let missed = 20 - correct; points += missed == 0 ? 50 : missed <= 2 ? 30 : missed <= 5 ? 10 : 0; if correct == 20 { unlocked = max(unlocked, min(levels.count, level + 1)) }; save() }
}
