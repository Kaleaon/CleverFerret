.class public interface abstract Lcom/flyersoft/books/mhtml/IMhtmlConstants;
.super Ljava/lang/Object;
.source "IMhtmlConstants.java"


# static fields
.field public static final BOUNDARY_REGEX:Ljava/lang/String; = "\\bb(\\s)*o(\\s)*u(\\s)*n(\\s)*d(\\s)*a(\\s)*r(\\s)*y(\\s)*\\=(\\s)*\"(\\S)*\""

.field public static final CONTENT_ID:Ljava/lang/String; = "\\bContent-ID(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s|\\>|\\<)+\\b"

.field public static final CONTENT_LOCATION_REGEX:Ljava/lang/String; = "\\bContent-Location(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s)+\\b"

.field public static final CONTENT_TRANSFER_ENCODING_REGEX:Ljava/lang/String; = "\\bContent-Transfer-Encoding(\\s)*:(\\s)*(\\w|\\-)+\\b"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "\\bContent-Type(\\s)*:(\\s)*(\\w|/|\\*)*\\b"

.field public static final CSS_REGEX:Ljava/lang/String; = "\\bContent-Type(\\s)*:(\\s)*text/css\\b"

.field public static final HTML_REGEX:Ljava/lang/String; = "(\\s)*Content-Type(\\s)*:(\\s)*text/html"

.field public static final IMAGE_REGEX:Ljava/lang/String; = "\\bContent-Type(\\s)*:(\\s)*(image/png|image/jpeg|image/gif|image/\\*){1}\\b"

.field public static final PART_SIGN:Ljava/lang/String; = "\\b(Content-Location|Content-ID){1}(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s|\\>|\\<)+\\b"
