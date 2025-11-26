.class public Lcom/vladsch/flexmark/util/html/ui/FontStyler;
.super Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;
.source "FontStyler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase<",
        "Ljava/awt/Font;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getStyle(Ljava/awt/Font;)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_0

    .line 26
    const-string p1, ""

    return-object p1

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1}, Ljava/awt/Font;->getFamily()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/awt/Font;->getSize()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object p1, v2, v1

    const-string p1, "font-family:%s;font-size:%dpt;font-style:normal;font-weight:normal"

    invoke-static {v0, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getStyle(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 23
    check-cast p1, Ljava/awt/Font;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/FontStyler;->getStyle(Ljava/awt/Font;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
