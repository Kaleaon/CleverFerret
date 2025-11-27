.class Lcom/flyersoft/staticlayout/TextUtils$Reverser;
.super Ljava/lang/Object;
.source "TextUtils.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Lcom/flyersoft/staticlayout/GetChars;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/TextUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Reverser"
.end annotation


# instance fields
.field private mEnd:I

.field private mSource:Ljava/lang/CharSequence;

.field private mStart:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .locals 0

    .line 468
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 469
    iput-object p1, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mSource:Ljava/lang/CharSequence;

    .line 470
    iput p2, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mStart:I

    .line 471
    iput p3, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mEnd:I

    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 2

    .line 490
    iget-object v0, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mSource:Ljava/lang/CharSequence;

    iget v1, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mEnd:I

    add-int/lit8 v1, v1, -0x1

    sub-int/2addr v1, p1

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-static {p1}, Landroid/text/AndroidCharacter;->getMirror(C)C

    move-result p1

    return p1
.end method

.method public getChars(II[CI)V
    .locals 5

    .line 494
    iget-object v0, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mSource:Ljava/lang/CharSequence;

    iget v1, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mStart:I

    add-int v2, p1, v1

    add-int/2addr v1, p2

    invoke-static {v0, v2, v1, p3, p4}, Lcom/flyersoft/staticlayout/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    sub-int/2addr p2, p1

    const/4 p1, 0x0

    .line 496
    invoke-static {p3, p1, p2}, Landroid/text/AndroidCharacter;->mirror([CII)Z

    .line 499
    div-int/lit8 v0, p2, 0x2

    :goto_0
    if-ge p1, v0, :cond_0

    add-int v1, p4, p1

    .line 501
    aget-char v2, p3, v1

    add-int v3, p4, p2

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    .line 503
    aget-char v4, p3, v3

    aput-char v4, p3, v1

    .line 504
    aput-char v2, p3, v3

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public length()I
    .locals 2

    .line 475
    iget v0, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mEnd:I

    iget v1, p0, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->mStart:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2

    sub-int v0, p2, p1

    .line 479
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 481
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->getChars(II[CI)V

    .line 482
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([C)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    .line 486
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/staticlayout/TextUtils$Reverser;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
