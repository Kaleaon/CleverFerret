.class public Lcom/flyersoft/staticlayout/AlteredCharSequence;
.super Ljava/lang/Object;
.source "AlteredCharSequence.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Lcom/flyersoft/staticlayout/GetChars;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/AlteredCharSequence$AlteredSpanned;
    }
.end annotation


# instance fields
.field private mChars:[C

.field private mEnd:I

.field private mSource:Ljava/lang/CharSequence;

.field private mStart:I


# direct methods
.method private constructor <init>(Ljava/lang/CharSequence;[CII)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mSource:Ljava/lang/CharSequence;

    .line 48
    iput-object p2, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mChars:[C

    .line 49
    iput p3, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    .line 50
    iput p4, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mEnd:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/CharSequence;[CIILcom/flyersoft/staticlayout/AlteredCharSequence-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/staticlayout/AlteredCharSequence;-><init>(Ljava/lang/CharSequence;[CII)V

    return-void
.end method

.method public static make(Ljava/lang/CharSequence;[CII)Lcom/flyersoft/staticlayout/AlteredCharSequence;
    .locals 7

    .line 39
    instance-of v0, p0, Landroid/text/Spanned;

    if-eqz v0, :cond_0

    .line 40
    new-instance v1, Lcom/flyersoft/staticlayout/AlteredCharSequence$AlteredSpanned;

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/staticlayout/AlteredCharSequence$AlteredSpanned;-><init>(Ljava/lang/CharSequence;[CIILcom/flyersoft/staticlayout/AlteredCharSequence-IA;)V

    return-object v1

    :cond_0
    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    .line 42
    new-instance p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/flyersoft/staticlayout/AlteredCharSequence;-><init>(Ljava/lang/CharSequence;[CII)V

    return-object p0
.end method


# virtual methods
.method public charAt(I)C
    .locals 2

    .line 93
    iget v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    if-lt p1, v0, :cond_0

    iget v1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mEnd:I

    if-ge p1, v1, :cond_0

    .line 94
    iget-object v1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mChars:[C

    sub-int/2addr p1, v0

    aget-char p1, v1, p1

    return p1

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    return p1
.end method

.method public getChars(II[CI)V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-static {v0, p1, p2, p3, p4}, Landroid/text/TextUtils;->getChars(Ljava/lang/CharSequence;II[CI)V

    .line 111
    iget v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 112
    iget v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mEnd:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    if-le p1, p2, :cond_0

    .line 115
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mChars:[C

    iget v1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    sub-int v1, p1, v1

    sub-int/2addr p2, p1

    invoke-static {v0, v1, p3, p4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-void
.end method

.method public length()I
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 3

    .line 104
    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0, p1, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mChars:[C

    iget v1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    sub-int/2addr v1, p1

    iget v2, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mEnd:I

    sub-int/2addr v2, p1

    invoke-static {p2, v0, v1, v2}, Lcom/flyersoft/staticlayout/AlteredCharSequence;->make(Ljava/lang/CharSequence;[CII)Lcom/flyersoft/staticlayout/AlteredCharSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 119
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/AlteredCharSequence;->length()I

    move-result v0

    .line 121
    new-array v1, v0, [C

    const/4 v2, 0x0

    .line 122
    invoke-virtual {p0, v2, v0, v1, v2}, Lcom/flyersoft/staticlayout/AlteredCharSequence;->getChars(II[CI)V

    .line 123
    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method update([CII)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mChars:[C

    .line 55
    iput p2, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mStart:I

    .line 56
    iput p3, p0, Lcom/flyersoft/staticlayout/AlteredCharSequence;->mEnd:I

    return-void
.end method
