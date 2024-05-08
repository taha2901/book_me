import 'author.dart';

class DataBooks {
	String? id;
	String? title;
	Author? author;
	String? description;
	int? price;
	int? newPrice;
	String? cover;
	double? rating;
	DateTime? createdAt;
	DateTime? updatedAt;
	bool? inFavorite;
	bool? inCart;
	int? averageRating;
	int? reviewCount;

	DataBooks({
		this.id, 
		this.title, 
		this.author, 
		this.description, 
		this.price, 
		this.newPrice, 
		this.cover, 
		this.rating, 
		this.createdAt, 
		this.updatedAt, 
		this.inFavorite, 
		this.inCart, 
		this.averageRating, 
		this.reviewCount, 
	});

	factory DataBooks.fromJson(Map<String, dynamic> json) => DataBooks(
				id: json['_id'] as String?,
				title: json['title'] as String?,
				author: json['author'] == null
						? null
						: Author.fromJson(json['author'] as Map<String, dynamic>),
				description: json['description'] as String?,
				price: json['price'] as int?,
				newPrice: json['new_price'] as int?,
				cover: json['cover'] as String?,
				rating: (json['rating'] as num?)?.toDouble(),
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				inFavorite: json['in_favorite'] as bool?,
				inCart: json['in_cart'] as bool?,
				averageRating: json['averageRating'] as int?,
				reviewCount: json['reviewCount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'title': title,
				'author': author?.toJson(),
				'description': description,
				'price': price,
				'new_price': newPrice,
				'cover': cover,
				'rating': rating,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'in_favorite': inFavorite,
				'in_cart': inCart,
				'averageRating': averageRating,
				'reviewCount': reviewCount,
			};
}
