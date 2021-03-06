//
//  UpdateVC.swift
//  Attics
//
//  Created by Zachary Wood on 1/10/20.
//  Copyright © 2020 Zachary Wood. All rights reserved.
//

import UIKit
import SwiftUI

class UpdateVC: UIViewController {
    
    lazy var vc = UIHostingController(rootView: UpdateView(dismiss: close))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add(vc)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: view.topAnchor),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    
    @objc func close() {
        dismiss(animated: true)
    }
}

struct UpdateView: View {
    let dismiss: () -> ()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                
                ZStack {
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 250)
                            .padding([.leading, .trailing], 16)
                        Text("New update!")
                            .font(.title)
                            .bold()
                        Text("What's new?")
                            .font(.title3)
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.trailing,  24)
                                .padding(.top, 8)
                                .onTapGesture {
                                    dismiss()
                                }
                        }
                        Spacer()
                    }
                }
                .padding(.top, 16)
                
                gapless.padding()
                share.padding()
                search.padding()
                redesign.padding()
                tipJar.padding()
                
            }
        }
    }
    
    var gapless: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Gapless playback!")
                .font(.title2)
                .bold()
            
            Text("By far the most requested feature, Attics now automatically loads the next song before the current song is finished, ensuring a near gapless transition. Enjoy those Help>Slip>Franklin's even more!")
        }
    }
    
    var share: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Share your favorite shows!")
                .font(.title2)
                .bold()
            
            Text("When viewing a recording, tap the \(Image(systemName: "square.and.arrow.up")) button in the upper right to share. You can share over iMessage, email, Twitter, or where ever you'd like!")
        }
    }
    
    var redesign: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Redesigned screens")
                .font(.title2)
                .bold()
            
            Text("The bands view, recording view, now playing view, and settings view have a fresh new look! Along with this came an internal reworking of the downloads system - you shouldn't notice anything on your end other than a smoother experience.")
        }
    }
    
    var search: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Search for shows")
                .font(.title2)
                .bold()
            
            Text("When viewing performances for a given year or viewing your saved shows, swipe down to search through the list. You can search by date, venue, and location. This is only the beginning: in the next update, I'll be adding an entirely new search tab with much more powerful functionality. Stay tuned!")
        }
    }
    
    var tipJar: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Tip jar")
                .font(.title2)
                .bold()
            
            Text("I've also added a tip jar to the \"more\" tab. Developing and running this app is a lot of fun and a passion project of mine, but it also costs a lot of time and money. If you feel so inclined, any small tips or just a nice message is always appriciated, but not expected :)")
        }
    }
}
