.class Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;
.super Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;
.source "MyLayout.java"

# interfaces
.implements Landroid/text/Spanned;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SpannedEllipsizer"
.end annotation


# instance fields
.field private mSpanned:Landroid/text/Spanned;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1453
    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;-><init>(Ljava/lang/CharSequence;)V

    .line 1454
    check-cast p1, Landroid/text/Spanned;

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    return-void
.end method


# virtual methods
.method public getSpanEnd(Ljava/lang/Object;)I
    .locals 1

    .line 1466
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    invoke-interface {v0, p1}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public getSpanFlags(Ljava/lang/Object;)I
    .locals 1

    .line 1470
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    invoke-interface {v0, p1}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public getSpanStart(Ljava/lang/Object;)I
    .locals 1

    .line 1462
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    invoke-interface {v0, p1}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public getSpans(IILjava/lang/Class;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/lang/Class<",
            "TT;>;)[TT;"
        }
    .end annotation

    .line 1458
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    invoke-interface {v0, p1, p2, p3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public nextSpanTransition(IILjava/lang/Class;)I
    .locals 1

    .line 1474
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    invoke-interface {v0, p1, p2, p3}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    move-result p1

    return p1
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 8

    sub-int v0, p2, p1

    .line 1478
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 1479
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->getChars(II[CI)V

    .line 1481
    new-instance v6, Landroid/text/SpannableString;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v6, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1482
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyLayout$SpannedEllipsizer;->mSpanned:Landroid/text/Spanned;

    const-class v5, Ljava/lang/Object;

    const/4 v7, 0x0

    move v3, p1

    move v4, p2

    invoke-static/range {v2 .. v7}, Lcom/flyersoft/staticlayout/TextUtils;->copySpansFrom(Landroid/text/Spanned;IILjava/lang/Class;Landroid/text/Spannable;I)V

    return-object v6
.end method
