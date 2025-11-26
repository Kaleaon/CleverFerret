.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Header"
.end annotation


# instance fields
.field private fontSize:F

.field style:Lcom/flyersoft/components/CSS$Style;


# direct methods
.method static bridge synthetic -$$Nest$fgetfontSize(Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;)F
    .locals 0

    iget p0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;->fontSize:F

    return p0
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 1

    .line 3259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3260
    iput-object p2, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;->style:Lcom/flyersoft/components/CSS$Style;

    .line 3261
    invoke-static {}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->-$$Nest$sfgetHEADER_SIZES()[F

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    add-int/lit8 p1, p1, -0x31

    aget p1, p2, p1

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Header;->fontSize:F

    return-void
.end method
