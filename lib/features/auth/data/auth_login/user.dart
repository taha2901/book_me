class User {
	String? username;
	String? email;
	bool? isAdmin;
	String? image;
	String? id;
	int? v;

	User({
		this.username, 
		this.email, 
		this.isAdmin, 
		this.image, 
		this.id, 
		this.v, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				username: json['username'] as String?,
				email: json['email'] as String?,
				isAdmin: json['isAdmin'] as bool?,
				image: json['image'] as String?,
				id: json['_id'] as String?,
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'username': username,
				'email': email,
				'isAdmin': isAdmin,
				'image': image,
				'_id': id,
				'__v': v,
			};
}
