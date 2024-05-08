
class RegisterModel {
    bool? success;
    Data? data;

    RegisterModel({this.success, this.data});

    RegisterModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    User? user;
    String? token;

    Data({this.user, this.token});

    Data.fromJson(Map<String, dynamic> json) {
        user = json["user"] == null ? null : User.fromJson(json["user"]);
        token = json["token"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(user != null) {
            _data["user"] = user?.toJson();
        }
        _data["token"] = token;
        return _data;
    }
}

class User {
    String? username;
    String? email;
    bool? isAdmin;
    String? id;
    int? v;

    User({this.username, this.email, this.isAdmin, this.id, this.v});

    User.fromJson(Map<String, dynamic> json) {
        username = json["username"];
        email = json["email"];
        isAdmin = json["isAdmin"];
        id = json["_id"];
        v = json["__v"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["username"] = username;
        _data["email"] = email;
        _data["isAdmin"] = isAdmin;
        _data["_id"] = id;
        _data["__v"] = v;
        return _data;
    }
}