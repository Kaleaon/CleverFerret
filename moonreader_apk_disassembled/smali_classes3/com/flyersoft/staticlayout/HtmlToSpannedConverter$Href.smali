.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Href"
.end annotation


# instance fields
.field public mAttributes:Lorg/xml/sax/Attributes;

.field public mHref:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 0

    .line 3247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3248
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mHref:Ljava/lang/String;

    .line 3249
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Href;->mAttributes:Lorg/xml/sax/Attributes;

    return-void
.end method
