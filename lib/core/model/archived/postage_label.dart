class PostageLabel {
  String createdAt;
  int dateAdvance;
  String id;
  String integratedForm;
  String labelDate;
  Null labelEpl2Url;
  Null labelFile;
  String labelFileType;
  Null labelPdfUrl;
  int labelResolution;
  String labelSize;
  String labelType;
  String labelUrl;
  String labelZplUrl;
  String object;
  String updatedAt;

  PostageLabel(
      {this.createdAt,
      this.dateAdvance,
      this.id,
      this.integratedForm,
      this.labelDate,
      this.labelEpl2Url,
      this.labelFile,
      this.labelFileType,
      this.labelPdfUrl,
      this.labelResolution,
      this.labelSize,
      this.labelType,
      this.labelUrl,
      this.labelZplUrl,
      this.object,
      this.updatedAt});

  PostageLabel.fromMap(Map<String, dynamic> map) {
    createdAt = map['created_at'];
    dateAdvance = map['date_advance'];
    id = map['id'];
    integratedForm = map['integrated_form'];
    labelDate = map['label_date'];
    labelEpl2Url = map['label_epl2_url'];
    labelFile = map['label_file'];
    labelFileType = map['label_file_type'];
    labelPdfUrl = map['label_pdf_url'];
    labelResolution = map['label_resolution'];
    labelSize = map['label_size'];
    labelType = map['label_type'];
    labelUrl = map['label_url'];
    labelZplUrl = map['label_zpl_url'];
    object = map['object'];
    updatedAt = map['updated_at'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['date_advance'] = this.dateAdvance;
    data['id'] = this.id;
    data['integrated_form'] = this.integratedForm;
    data['label_date'] = this.labelDate;
    data['label_epl2_url'] = this.labelEpl2Url;
    data['label_file'] = this.labelFile;
    data['label_file_type'] = this.labelFileType;
    data['label_pdf_url'] = this.labelPdfUrl;
    data['label_resolution'] = this.labelResolution;
    data['label_size'] = this.labelSize;
    data['label_type'] = this.labelType;
    data['label_url'] = this.labelUrl;
    data['label_zpl_url'] = this.labelZplUrl;
    data['object'] = this.object;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
