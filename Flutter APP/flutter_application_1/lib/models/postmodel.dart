class PostBot {
  Dashain? dashain;
  Dashain? tihar;

  PostBot({this.dashain, this.tihar});

  PostBot.fromJson(Map<dynamic, dynamic> json) {
    dashain =
        json['Dashain'] != null ? new Dashain.fromJson(json['Dashain']) : null;
    tihar = json['Tihar'] != null ? new Dashain.fromJson(json['Tihar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashain != null) {
      data['Dashain'] = this.dashain!.toJson();
    }
    if (this.tihar != null) {
      data['Tihar'] = this.tihar!.toJson();
    }
    return data;
  }
}

class Dashain {
  String? url;
  String? text;

  Dashain({this.url, this.text});

  Dashain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
