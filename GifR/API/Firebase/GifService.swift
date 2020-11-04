//
//  LikesService.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-03.
//

import Foundation
import FirebaseDatabase

class GifService: FirebaseService {

    private let user = AuthService.shared.currentUser!
    static let shared = GifService()

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
            
            if let value = child.value as? String {
                return Gif(uid: child.key, url: value)
            }
            return nil
        }
        completion(.success(gifs))
    }

    func likeGif(_ gif: Gif, completion: @escaping SuccessResult) {

        guard let url = gif.imageOriginalUrl?.absoluteString else {
            completion(false, nil)
            return
        }

        ref.child(.gifs).child(user.uid).childByAutoId().setValue(url) { (error, _) in
            completion(error == nil, error)
        }
    }
}
