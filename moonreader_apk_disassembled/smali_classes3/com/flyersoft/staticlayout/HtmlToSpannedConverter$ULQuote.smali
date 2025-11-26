.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ULQuote"
.end annotation


# instance fields
.field style:Lcom/flyersoft/components/CSS$Style;


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/CSS$Style;)V
    .locals 0

    .line 3171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3172
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$ULQuote;->style:Lcom/flyersoft/components/CSS$Style;

    return-void
.end method
