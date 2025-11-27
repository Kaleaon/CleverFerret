.class Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;
.super Ljava/lang/Object;
.source "MyLayout.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Lcom/flyersoft/staticlayout/GetChars;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Ellipsizer"
.end annotation


# instance fields
.field mLayout:Lcom/flyersoft/staticlayout/MyLayout;

.field mMethod:Lcom/flyersoft/staticlayout/TextUtils$TruncateAt;

.field mText:Ljava/lang/CharSequence;

.field mWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1407
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mText:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 3

    const/4 v0, 0x1

    .line 1411
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->obtain(I)[C

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    const/4 v2, 0x0

    .line 1412
    invoke-virtual {p0, p1, v1, v0, v2}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->getChars(II[CI)V

    .line 1413
    aget-char p1, v0, v2

    .line 1415
    invoke-static {v0}, Lcom/flyersoft/staticlayout/TextUtils;->recycle([C)V

    return p1
.end method

.method public getChars(II[CI)V
    .locals 9

    .line 1420
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v0

    .line 1421
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v1

    .line 1423
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mText:Ljava/lang/CharSequence;

    invoke-static {v2, p1, p2, p3, p4}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    move v6, v0

    :goto_0
    if-gt v6, v1, :cond_0

    .line 1426
    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    move v4, p1

    move v5, p2

    move-object v7, p3

    move v8, p4

    invoke-static/range {v3 .. v8}, Lcom/flyersoft/staticlayout/MyLayout;->-$$Nest$mellipsize(Lcom/flyersoft/staticlayout/MyLayout;III[CI)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public length()I
    .locals 1

    .line 1431
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->mText:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2

    sub-int v0, p2, p1

    .line 1435
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 1436
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->getChars(II[CI)V

    .line 1437
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([C)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1441
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->length()I

    move-result v0

    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 1442
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->length()I

    move-result v2

    invoke-virtual {p0, v1, v2, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout$Ellipsizer;->getChars(II[CI)V

    .line 1443
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method
