class Author {
	String? id;
	String? firstName;
	String? lastName;
	String? bio;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;

	Author({
		this.id, 
		this.firstName, 
		this.lastName, 
		this.bio, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory Author.fromJson(Map<String, dynamic> json) => Author(
				id: json['_id'] as String?,
				firstName: json['firstName'] as String?,
				lastName: json['lastName'] as String?,
				bio: json['bio'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'firstName': firstName,
				'lastName': lastName,
				'bio': bio,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
			};
}
