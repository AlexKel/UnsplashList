//
//  PhotoDetailsView.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import SwiftUI

struct PhotoDetailsView: View {
    let photo: Photo
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: photo.urls.regular)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.4)
            }
            .frame(height: UIScreen.main.bounds.height / 3)
            .clipShape(Rectangle())
            
            HStack {
                AsyncImage(url: URL(string: photo.user.profileImage.medium)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    Circle()
                        .foregroundColor(.gray.opacity(0.4))
                }
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                Text(photo.user.name).font(.headline)
                Spacer()
                Text("\(photo.likes) 👍").font(.headline)
            }.padding(.horizontal, 10)
        }
        .ignoresSafeArea(edges: .top)
        .frame(height: UIScreen.main.bounds.height, alignment: .top)
    }
    
}

struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.stub
        let photoURLs = PhotoURLs.stub
        let photo = Photo(id: "photoId",
                          createdAt: .now,
                          updatedAt: .now,
                          likes: 2,
                          likedByUser: false,
                          user: user,
                          urls: photoURLs)
        PhotoDetailsView(photo: photo)
    }
}
