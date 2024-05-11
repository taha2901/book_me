import 'data.dart';

class Auth {
	bool? success;
	Data? data;

	Auth({this.success, this.data});

	factory Auth.fromJson(Map<String, dynamic> json) => Auth(
				success: json['success'] as bool?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'data': data?.toJson(),
			};
}
