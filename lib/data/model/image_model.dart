// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class ImageModel {
  String? imagecodeId;
  String? imagecodeName;
  String? imagecodePrice;
  String? imagecodeLevel;

  ImageModel(
      {this.imagecodeId,
      this.imagecodeName,
      this.imagecodePrice,
      this.imagecodeLevel});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imagecodeId = json['imagecode_id'];
    imagecodeName = json['imagecode_name'];
    imagecodePrice = json['imagecode_price'];
    imagecodeLevel = json['imagecode_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagecode_id'] = this.imagecodeId;
    data['imagecode_name'] = this.imagecodeName;
    data['imagecode_price'] = this.imagecodePrice;
    data['imagecode_level'] = this.imagecodeLevel;
    return data;
  }
}
