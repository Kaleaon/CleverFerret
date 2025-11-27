.class public Lcom/vladsch/flexmark/util/html/ui/FontStyleStyler;
.super Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;
.source "FontStyleStyler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase<",
        "Lcom/vladsch/flexmark/util/html/ui/FontStyle;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getStyle(Lcom/vladsch/flexmark/util/html/ui/FontStyle;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    .line 23
    const-string p1, ""

    return-object p1

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->isItalic()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "font-style:italic;"

    goto :goto_0

    :cond_1
    const-string v0, "font-style:normal;"

    .line 25
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->isBold()Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "font-weight:bold"

    goto :goto_1

    :cond_2
    const-string p1, "font-weight:normal"

    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getStyle(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 20
    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/FontStyleStyler;->getStyle(Lcom/vladsch/flexmark/util/html/ui/FontStyle;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
