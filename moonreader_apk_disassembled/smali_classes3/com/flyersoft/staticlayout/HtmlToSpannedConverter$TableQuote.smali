.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TableQuote"
.end annotation


# instance fields
.field style:Lcom/flyersoft/components/CSS$Style;

.field tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 0

    .line 3156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3157
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->tag:Ljava/lang/String;

    .line 3158
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$TableQuote;->style:Lcom/flyersoft/components/CSS$Style;

    return-void
.end method
