import 'datum.dart';
import 'pagination.dart';

class Book {
	bool? success;
	int? results;
	Pagination? pagination;
	List<DataBooks>? data;

	Book({this.success, this.results, this.pagination, this.data});

	factory Book.fromJson(Map<String, dynamic> json) => Book(
				success: json['success'] as bool?,
				results: json['results'] as int?,
				pagination: json['pagination'] == null
						? null
						: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
				data: (json['data'] as List<dynamic>?)
						?.map((e) => DataBooks.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'results': results,
				'pagination': pagination?.toJson(),
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
