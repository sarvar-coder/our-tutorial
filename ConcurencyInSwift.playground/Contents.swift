//import SwiftUI
//
//var greeting = "Hello, playground"
//
//let task = Task {
//    print("Doing some work on a task")
//    let sum = (1...10000000).reduce(1,+)
//    print("1 + 2 + 3 ... + 100 = \(sum)")
//    try Task.checkCancellation()
//}
//print("Doing some work on the main actor")
////task.cancel()
//
/////1. Task.sleep is an async function. An async function can suspend and resume execution, and you can’t do that on the main actor.
///// 2. Task.sleep can throw an error, which it needs to do to support cancellation, so you need to use try, try? or try!.
//
///// Just as the try flags indicate that a function can fail, marking it with await recognizes that it can suspend and later resume execution, which is what sleep does.
//func helloPauseGoodbye() async throws {
//    print("Hello")
//    try await Task.sleep(nanoseconds: 1_000_000_000)
//    print("Goodbye")
//}
//
//Task {
//  try await helloPauseGoodbye()
//}
//
//
//// MARK: -  Decoding an API — learning domains
//
//struct Domains: Decodable {
//    let data: [Domain]
//}
//
//struct Domain: Decodable {
//    let attributes: Attributes
//}
//
//struct Attributes: Decodable {
//    let name: String
//    let description: String
//    let level: String
//}
//
/////1. Create a URL to download from. You can use force unwrapping here because this URL string isn’t external, untrusted input, and you can guarantee that it’s well- formed.
/////2. Use URLSession.shared.data(from:) to receive the data and response from the server. This method is asynchronous, so you must mark its call with await. This suspension point frees up your program to do other things while waiting for the call to complete. The call also throws errors, so you must mark it with try. In addition to data, this method returns a response type, but you can ignore it with \_.
///// 3. Decode the received data and grab the list of domains stored in the data property.
//
//func fetchDomains() async throws -> [Domain] {
//    
//    let url = URL(string: "https://api.kodeco.com/api/domains")!
//    
//    let (data, _) = try await URLSession.shared.data(from: url)
//    
//    return try JSONDecoder().decode(Domains.self, from: data).data
//}
//
/////1. Creating a Task context you can await.
//
/////2. Creating a block to try and catch errors.
//
/////3. Performing the actual download. await recognizes that the task can suspend here while other things are happening.
//
/////4. Printing out the list of learning domains.
//Task {
//    do {
//        let result = try await fetchDomains()
//        print(result[0].attributes.description)
//    } catch {
//        print(error.localizedDescription)
//    }
//}
//
//func findTitle(url: URL) async throws -> String? {
//    
//    for try await line in url.lines {
//        if line.contains("<title>") {
//            return line.trimmingCharacters(in: .whitespaces)
//        }
//    }
//    return nil
//}
//
//Task {
//  if let title = try await findTitle(url: URL(string:"https://www.raywenderlich.com")!) {
//    print(title)
//  }
//}
//
//
/////• Attempts to find the first title, then suspends.
//
/////• Attempts to find the second title, then suspends
//
/////• Serially returns the result.
//
/////
//func findTitlesSerial(first: URL, second: URL) async throws -> (String?, String?) {
//    
//    let title1 = try await findTitle(url: first)
//    let title2 = try await findTitle(url: second)
//    
//    return (title1, title2)
//}
//
/////1. The declaration async let spins up a new child task that finds the first title.
/////2. The declaration async let spins up another child task in parallel that finds the second title.
/////3. try await takes a sequence of asynchronous tasks and waits for them to finish.
///// 4. The results are returned as a tuple.
//
/////
//func findTitlesParallel(first: URL, second: URL) async throws -> (String?, String?) {
//    
//    async let title1 = findTitle(url: first)   // 1
//    async let title2 = findTitle(url: second)  // 2
//    let titles = try await [title1, title2]    // 3
//    return (titles[0], titles[1])              // 4
//}
//
//// MARK: - Asynchronous properties and subscripts
//
//extension Domains {
//    static var domains: [Domain] {
//        get async throws {
//            try await fetchDomains()
//        }
//    }
//}
//
//Task {
//    dump(try await Domains.domains[2].attributes.description)
//}
//
//extension Domains {
//    
//    enum Error: Swift.Error { case outOfRange }
//    
//    static subscript(_ index: Int) -> String {
//        
//        get async throws {
//            
//            let domains = try await Self.domains
//            
//            guard domains.indices.contains(index) else {
//                throw Error.outOfRange
//            }
//            
//            return domains[index].attributes.name
//        }
//    }
//}
//
//Task {
//    dump(try await Domains[9])
//}

// MARK: - Introducing actors

// 1
actor Playlist {
    
    let title: String
    let author: String
    private(set) var songs: [String]
    
    init(title: String, author: String, songs: [String]) {
        
        self.title = title
        self.author = author
        self.songs = songs
    }
    
    func add(song: String) {
        songs.append(song)
    }
    
    func remove(song: String) {
        
        guard !songs.isEmpty, let index = songs.firstIndex(of: song)
        else {
            return
        }
        
        songs.remove(at: index)
    }
    // 3
    func move(song: String, from playlist: Playlist) async {
        // 2
        await playlist.remove(song: song)
        add(song: song)
    }
    
    func move(song: String, to playlist: Playlist) async {
        await playlist.add(song: song)
        remove(song: song)
    }
}

let favorites = Playlist(title: "Favorite songs",
                         author: "Cosmin",
                         songs: ["Nothing else matters"])
let partyPlaylist = Playlist(title: "Party songs",
                             author: "Ray",
                             songs: ["Stairway to heaven"])

Task {
  await favorites.move(song: "Stairway to heaven", from:
partyPlaylist)
  await favorites.move(song: "Nothing else matters", to:
partyPlaylist)
  await print(favorites.songs)
}

extension Playlist: CustomStringConvertible {
  nonisolated var description: String {
    "\(title) by \(author)."
  }
}
print(favorites) // "Favorite songs by Cosmin."

// MARK: - SENDABLE

final class BasicPlaylist {
  let title: String
  let author: String
  init(title: String, author: String) {
    self.title = title
    self.author = author
  }
}

extension BasicPlaylist: Sendable {}


// 1
func execute(task: @escaping @Sendable () -> Void,
             with priority: TaskPriority? = nil) {
  Task(priority: priority, operation: task)
}
// 2
@Sendable func showRandomNumber() {
  let number = Int.random(in: 1...10)
  print(number)
}

execute(task: showRandomNumber)

// MARK: - CHallenges

actor Team {
    let name: String
    let stadium: String
    private var players: [String]
    
    init(name: String, stadium: String, players: [String]) {
        self.name = name
        self.stadium = stadium
        self.players = players
    }
    
    private func add(player: String) {
        players.append(player)
    }
    
    private func remove(player: String) {
        guard !players.isEmpty, let index = players.firstIndex(of: player) else { return }
         
        players.remove(at: index)
    }
    
    func buy(player: String, from team: Team) async {
       await team.remove(player: player)
        add(player: player)
    }
    
    func sell(player: String, to team: Team) async {
       await team.add(player: player)
        remove(player: player)
    }
}

extension Team: CustomStringConvertible {
    nonisolated var description: String {
        "Team: \(name), Stadium: \(stadium)"
    }
}

class BasicTeam {
    
    var name: String
    var stadium: String
    
    init(name: String, stadium: String) {
        self.name = name
        self.stadium = stadium
    }
}
