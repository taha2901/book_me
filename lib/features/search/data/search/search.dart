import 'datum.dart';

class Search {
	bool? success;
	int? results;
	List<Datum>? data;

	Search({this.success, this.results, this.data});

	factory Search.fromJson(Map<String, dynamic> json) => Search(
				success: json['success'] as bool?,
				results: json['results'] as int?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'results': results,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
