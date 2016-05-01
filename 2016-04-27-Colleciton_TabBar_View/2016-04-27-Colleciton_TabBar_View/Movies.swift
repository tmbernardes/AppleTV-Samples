//
//  Movies.swift
//  Movie Fan
//
//  Created by Marcos Morais on 27/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class Movies: NSObject {
    

    static let movies: [(title: String,description: String, relase: String,imageName: String)] = [
        ("Heróis da Galáxia: Ratchet e Clank","When the galaxy comes under the threat of a nefarious space captain, a mechanic and his newfound robot ally join an elite squad of combatants to save the universe.","05/05/2016","ratchet.jpg"),
        ("Mogli: O Menino Lobo","The man-cub Mowgli flees the jungle after a threat from the tiger Shere Khan. Guided by Bagheera the panther and the bear Baloo, Mowgli embarks on a journey of self-discovery, though he also meets creatures who don't have his best interests at heart.","14/04/2016", "mogli.jpg"),
        ("Zootopia","In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.","17/03/2016", "zootopia.jpg"),
        ("Batman vs Superman: A Origem da Justiça","Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.","24/03/2016", "batmanvssuperman.jpg"),
        ("Capitão América: Guerra Civil","Political interference in the Avengers' activities causes a rift between former allies Captain America and Iron Man.","28/04/2016", "captainamerica.jpg"),
        ("Pelé: O Nascimento de uma Lenda", "Pele's meteoric rise from the slums of Sao Paulo to leading to Brazil to its first World Cup victory at the age of 17 is chronicled in this biographical drama.","07/05/2016","pele.jpg"),
        ("Angry Birds: O Filme", "Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.","12/05/2016","angry.jpg"),
        ("Alice Através do Espelho", "Alice returns to the whimsical world of Wonderland and travels back in time to save the Mad Hatter.","26/05/2015","alice.jpg"),
        ("Warcraft", "The peaceful realm of Azeroth stands on the brink of war as its civilization faces a fearsome race of invaders: orc warriors fleeing their dying home to colonize another. As a portal opens to connect the two worlds, one army faces destruction and the other faces extinction. From opposing sides, two heroes are set on a collision course that will decide the fate of their family, their people, and their home.","09/06/2016","warcraft.jpg"),
    ]
    
    
    static var favoriteMovies = [(title: String,description: String, relase: String,imageName: String)]()

}
