.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Big"
.end annotation


# instance fields
.field inherited:Z

.field size:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/CSS$Style;)V
    .locals 3

    .line 3142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3fa00000    # 1.25f

    .line 3140
    iput v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->size:F

    const/4 v0, 0x1

    .line 3141
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->inherited:Z

    if-eqz p2, :cond_0

    .line 3143
    iget v1, p2, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 3144
    iget p1, p2, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->size:F

    .line 3145
    iget-boolean p1, p2, Lcom/flyersoft/components/CSS$Style;->fontSizeInherited:Z

    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->inherited:Z

    return-void

    .line 3146
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/components/CSS;->isHeaderTag(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 3147
    invoke-static {}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->-$$Nest$sfgetHEADER_SIZES()[F

    move-result-object p2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    add-int/lit8 p1, p1, -0x31

    aget p1, p2, p1

    iput p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Big;->size:F

    :cond_1
    return-void
.end method
