.class public Lorg/nibor/autolink/internal/WwwScanner;
.super Ljava/lang/Object;
.source "WwwScanner.java"

# interfaces
.implements Lorg/nibor/autolink/internal/Scanner;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static findFirst(Ljava/lang/CharSequence;II)I
    .locals 0

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p1, -0x1

    .line 40
    invoke-interface {p0, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    invoke-static {p0}, Lorg/nibor/autolink/internal/WwwScanner;->isAllowed(C)Z

    move-result p0

    if-eqz p0, :cond_1

    :goto_0
    return p1

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private static findLast(Ljava/lang/CharSequence;I)I
    .locals 4

    .line 48
    invoke-static {p0, p1}, Lorg/nibor/autolink/internal/Scanners;->findUrlEnd(Ljava/lang/CharSequence;I)I

    move-result v0

    move v1, v0

    :cond_0
    const/4 v2, -0x1

    add-int/2addr v1, v2

    if-le v1, p1, :cond_1

    .line 54
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_0

    if-le v1, p1, :cond_0

    return v0

    :cond_1
    return v2
.end method

.method private static isAllowed(C)Z
    .locals 1

    const/16 v0, 0x2e

    if-eq p0, v0, :cond_0

    .line 61
    invoke-static {p0}, Lorg/nibor/autolink/internal/Scanners;->isAlnum(C)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static isWWW(Ljava/lang/CharSequence;I)Z
    .locals 2

    add-int/lit8 v0, p1, 0x1

    .line 66
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x77

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    .line 67
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_0

    add-int/lit8 p1, p1, 0x3

    .line 68
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    const/16 p1, 0x2e

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public scan(Ljava/lang/CharSequence;II)Lorg/nibor/autolink/LinkSpan;
    .locals 3

    add-int/lit8 v0, p2, 0x4

    .line 17
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_3

    invoke-static {p1, p2}, Lorg/nibor/autolink/internal/WwwScanner;->isWWW(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p1, p2, p3}, Lorg/nibor/autolink/internal/WwwScanner;->findFirst(Ljava/lang/CharSequence;II)I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_1

    return-object v2

    .line 26
    :cond_1
    invoke-static {p1, v0}, Lorg/nibor/autolink/internal/WwwScanner;->findLast(Ljava/lang/CharSequence;I)I

    move-result p1

    if-ne p1, p3, :cond_2

    return-object v2

    .line 31
    :cond_2
    new-instance p3, Lorg/nibor/autolink/internal/LinkSpanImpl;

    sget-object v0, Lorg/nibor/autolink/LinkType;->WWW:Lorg/nibor/autolink/LinkType;

    add-int/lit8 p1, p1, 0x1

    invoke-direct {p3, v0, p2, p1}, Lorg/nibor/autolink/internal/LinkSpanImpl;-><init>(Lorg/nibor/autolink/LinkType;II)V

    return-object p3

    :cond_3
    :goto_0
    return-object v2
.end method
