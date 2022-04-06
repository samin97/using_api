import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, description;
  final List<String> images;
  final List<String> manufactureID;
  final double oldPrice, price;


  Product({
    required this.id,
    required this.images,
    required this.manufactureID,
    this.oldPrice = 0.0,
    required this.name,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/book1.png",
      "assets/images/book5.png",
      "assets/images/book2.png",
      "assets/images/book3.png",
    ],
    manufactureID: [
      "kjadbkaj12",
      "kjadbkaj12",
      "kjadbkaj12"
    ],
    name: "Harry potter series",
    price: 64.99,
    description: description,
    oldPrice: 64.8,

  ),
  Product(
    id: 2,
    images: [
      "assets/images/book3.png",
    ],
    manufactureID: [
      "kjadbkaj12",
      "kjadbkaj12",
      "kjadbkaj12"
    ],
    name: "Alchemist",
    price: 50.5,
    description: description,
    oldPrice: 54.1,

  ),
  Product(
    id: 3,
    images: [
      "assets/images/book3.png",
    ],
    manufactureID: [
      "kjadbkaj12",
      "kjadbkaj12",
      "kjadbkaj12"
    ],
    name: "Percy Jackson",
    price: 36.55,
    description: description,
    oldPrice: 34.1,

  ),
  Product(
    id: 4,
    images: [
      "assets/images/book3.png",
    ],
    manufactureID: [
      "kjadbkaj12",
      "kjadbkaj12",
      "kjadbkaj12"
    ],
    name: "Lost Ark",
    price: 20.20,
    description: description,
    oldPrice: 24.1,

  ),
];

const String description =
    "these are books...";
