//
//  LikesService.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation
import FirebaseDatabase

class GifService: FirebaseService {

    static let shared = GifService()

    private var user: User {
        return AuthService.shared.currentUser!
    }

    typealias GifsResult = (Result<[Gif], Error>) -> Void

    func fetchLikedGifs(completion: @escaping GifsResult) {

        ref.child(.gifs).child(user.uid).observeSingleEvent(of: .value) { (snapshot) in
            self.deserializeGifs(snapshot: snapshot, completion: completion)
        }
    }

    private func deserializeGifs(snapshot: DataSnapshot, completion: @escaping GifsResult) {

        guard let children = snapshot.children.allObjects as? [DataSnapshot] else {
            completion(.failure(NSError(message: "Problem deserializing gifs.")))
            return
        }

        let gifs = children.compactMap { child -> Gif? in
            
            if let value = child.value as? [AnyHashable: Any] {
                let gif = Gif(dictionary: value)
                gif.uid = child.key
                return gif
            }
            return nil
        }
        completion(.success(gifs))
    }

    func likeGif(_ gif: Gif, completion: @escaping SuccessResult) {

        ref.child(.gifs).child(user.uid).childByAutoId().setValue(gif.toDictionary()) { (error, _) in
            completion(error == nil, error)
        }
    }
}
