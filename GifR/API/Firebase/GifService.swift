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

    func likeGif(_ gif: Gif, completion: @escaping SuccessResult) {

        guard let url = gif.imageOriginalUrl?.absoluteString, let user = AuthService.shared.currentUser else {
            completion(false, nil)
            return
        }

        ref.child(.gifs).child(user.uid).childByAutoId().setValue(url) { (error, _) in
            completion(error == nil, error)
        }
    }
}
