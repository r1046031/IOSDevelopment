//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    var movies : [Movie]
    
    init(){
        movies = [Movie]()
    }
    
//    func getMovies() -> [Movie] {
//        return movies
//    }
    
    func getMovies(actor: Actor) -> [Movie] {
        //filter -> eerst de group die nil is eruit halen
        let moviesFromActor = movies.filter { movie in
            movie.actors.contains { actorFromMovie in
                        actorFromMovie.firstName == actor.firstName &&
                        actorFromMovie.lastName == actor.lastName
                    }
        }
        
        //set voor de dubbele waarden eruit te halen
        return moviesFromActor
    }
    
    func getMovies(director: Director) -> [Movie] {
        //filter -> eerst de group die nil is eruit halen
        let moviesFromDirector = movies.filter {
            $0.director == director
        }
        
        //set voor de dubbele waarden eruit te halen
        return moviesFromDirector
    }
    
    func getActors(director: Director) -> [Actor] {
//            //filter
//            let moviesFromDirector = movies.filter {
//                $0.director == director
//            }
//
//            //map
//            let actorsWithDirector = moviesFromDirector.map {
//                $0.actors
//            }
//
//            //set voor de dubbele waarden eruit te halen
//            return moviesFromDirector.actors()
        
        let actors = movies
            .filter { $0.director == director }   // stap 1
            .flatMap { $0.actors }                // stap 2: flatten array van actors
           
        // stap 3: duplicates verwijderen
        return Array(Set(actors))
    }
    
    private func sort() {
        self.movies = Array(Set(self.movies)).sorted {
            $0.title < $1.title
        }
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            movies = try load("movies.json")
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }
}
