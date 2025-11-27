.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FloatQuote"
.end annotation


# instance fields
.field attributes:Lorg/xml/sax/Attributes;

.field imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

.field style:Lcom/flyersoft/components/CSS$Style;

.field tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 0

    .line 3192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3193
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->tag:Ljava/lang/String;

    .line 3194
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$FloatQuote;->style:Lcom/flyersoft/components/CSS$Style;

    return-void
.end method
