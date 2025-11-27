.class public Lorg/nibor/autolink/internal/UrlScanner;
.super Ljava/lang/Object;
.source "UrlScanner.java"

# interfaces
.implements Lorg/nibor/autolink/internal/Scanner;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private findFirst(Ljava/lang/CharSequence;II)I
    .locals 5

    const/4 v0, -0x1

    const/4 v1, -0x1

    const/4 v2, -0x1

    :goto_0
    if-lt p2, p3, :cond_3

    .line 36
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 37
    invoke-static {v3}, Lorg/nibor/autolink/internal/Scanners;->isAlpha(C)Z

    move-result v4

    if-eqz v4, :cond_0

    move v1, p2

    goto :goto_1

    .line 39
    :cond_0
    invoke-static {v3}, Lorg/nibor/autolink/internal/Scanners;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_1

    move v2, p2

    goto :goto_1

    .line 41
    :cond_1
    invoke-static {v3}, Lorg/nibor/autolink/internal/UrlScanner;->schemeSpecial(C)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_3
    :goto_2
    if-lez v1, :cond_4

    add-int/lit8 p1, v1, -0x1

    if-ne p1, v2, :cond_4

    return v0

    :cond_4
    return v1
.end method

.method private static schemeSpecial(C)Z
    .locals 1

    const/16 v0, 0x2b

    if-eq p0, v0, :cond_0

    const/16 v0, 0x2d

    if-eq p0, v0, :cond_0

    const/16 v0, 0x2e

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public scan(Ljava/lang/CharSequence;II)Lorg/nibor/autolink/LinkSpan;
    .locals 4

    .line 15
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/lit8 v1, p2, 0x3

    const/4 v2, 0x0

    if-ge v1, v0, :cond_2

    add-int/lit8 v0, p2, 0x1

    .line 17
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v3, 0x2f

    if-ne v0, v3, :cond_2

    add-int/lit8 v0, p2, 0x2

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-eq v0, v3, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lorg/nibor/autolink/internal/UrlScanner;->findFirst(Ljava/lang/CharSequence;II)I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_1

    return-object v2

    .line 26
    :cond_1
    invoke-static {p1, v1}, Lorg/nibor/autolink/internal/Scanners;->findUrlEnd(Ljava/lang/CharSequence;I)I

    move-result p1

    .line 28
    new-instance p3, Lorg/nibor/autolink/internal/LinkSpanImpl;

    sget-object v0, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    add-int/lit8 p1, p1, 0x1

    invoke-direct {p3, v0, p2, p1}, Lorg/nibor/autolink/internal/LinkSpanImpl;-><init>(Lorg/nibor/autolink/LinkType;II)V

    return-object p3

    :cond_2
    :goto_0
    return-object v2
.end method
