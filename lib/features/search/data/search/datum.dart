import 'author.dart';

class Datum {
	double? rating;
	String? id;
	String? title;
	Author? author;
	String? description;
	int? price;
	String? cover;
	int? averageRating;
	int? reviewCount;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;
	int? newPrice;

	Datum({
		this.rating, 
		this.id, 
		this.title, 
		this.author, 
		this.description, 
		this.price, 
		this.cover, 
		this.averageRating, 
		this.reviewCount, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
		this.newPrice, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				rating: (json['rating'] as num?)?.toDouble(),
				id: json['_id'] as String?,
				title: json['title'] as String?,
				author: json['author'] == null
						? null
						: Author.fromJson(json['author'] as Map<String, dynamic>),
				description: json['description'] as String?,
				price: json['price'] as int?,
				cover: json['cover'] as String?,
				averageRating: json['averageRating'] as int?,
				reviewCount: json['reviewCount'] as int?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
				newPrice: json['new_price'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'rating': rating,
				'_id': id,
				'title': title,
				'author': author?.toJson(),
				'description': description,
				'price': price,
				'cover': cover,
				'averageRating': averageRating,
				'reviewCount': reviewCount,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
				'new_price': newPrice,
			};
}
