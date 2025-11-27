.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockQuote"
.end annotation


# instance fields
.field style:Lcom/flyersoft/components/CSS$Style;


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/CSS$Style;)V
    .locals 0

    .line 3177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3178
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$BlockQuote;->style:Lcom/flyersoft/components/CSS$Style;

    return-void
.end method
