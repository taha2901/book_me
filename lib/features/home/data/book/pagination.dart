class Pagination {
	int? total;
	int? page;
	int? limit;
	int? pages;
	dynamic next;
	dynamic prev;

	Pagination({
		this.total, 
		this.page, 
		this.limit, 
		this.pages, 
		this.next, 
		this.prev, 
	});

	factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
				total: json['total'] as int?,
				page: json['page'] as int?,
				limit: json['limit'] as int?,
				pages: json['pages'] as int?,
				next: json['next'] as dynamic,
				prev: json['prev'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'total': total,
				'page': page,
				'limit': limit,
				'pages': pages,
				'next': next,
				'prev': prev,
			};
}
