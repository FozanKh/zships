class LabelDownload {
    LabelDownload({
        this.pdf,
        this.png,
        this.zpl,
        this.href,
    });

    String pdf;
    String png;
    String zpl;
    String href;

    factory LabelDownload.fromMap(Map<String, dynamic> json) => LabelDownload(
        pdf: json["pdf"] == null ? null : json["pdf"],
        png: json["png"] == null ? null : json["png"],
        zpl: json["zpl"] == null ? null : json["zpl"],
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toMap() => {
        "pdf": pdf == null ? null : pdf,
        "png": png == null ? null : png,
        "zpl": zpl == null ? null : zpl,
        "href": href == null ? null : href,
    };
}
