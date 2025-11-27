.class public Lorg/nibor/autolink/internal/EmailScanner;
.super Ljava/lang/Object;
.source "EmailScanner.java"

# interfaces
.implements Lorg/nibor/autolink/internal/Scanner;


# instance fields
.field private final domainMustHaveDot:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p1, p0, Lorg/nibor/autolink/internal/EmailScanner;->domainMustHaveDot:Z

    return-void
.end method

.method private findFirst(Ljava/lang/CharSequence;II)I
    .locals 5

    const/4 v0, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_0
    if-lt p2, p3, :cond_2

    .line 41
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 42
    invoke-direct {p0, v3}, Lorg/nibor/autolink/internal/EmailScanner;->localAtomAllowed(C)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x0

    move v0, p2

    const/4 v2, 0x0

    goto :goto_1

    :cond_0
    const/16 v4, 0x2e

    if-ne v3, v4, :cond_2

    if-eqz v2, :cond_1

    goto :goto_2

    :cond_1
    const/4 v2, 0x1

    :goto_1
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_2
    :goto_2
    return v0
.end method

.method private findLast(Ljava/lang/CharSequence;I)I
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    .line 63
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-ge p2, v7, :cond_5

    .line 64
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    if-eqz v3, :cond_0

    .line 66
    invoke-direct {p0, v7}, Lorg/nibor/autolink/internal/EmailScanner;->subDomainAllowed(C)Z

    move-result v3

    if-eqz v3, :cond_5

    move v6, p2

    const/4 v3, 0x0

    :goto_1
    const/4 v4, 0x1

    goto :goto_2

    :cond_0
    const/16 v8, 0x2e

    if-ne v7, v8, :cond_3

    if-nez v4, :cond_1

    goto :goto_3

    :cond_1
    if-ne v5, v2, :cond_2

    move v5, p2

    :cond_2
    const/4 v3, 0x1

    goto :goto_2

    :cond_3
    const/16 v4, 0x2d

    if-ne v7, v4, :cond_4

    const/4 v4, 0x0

    goto :goto_2

    .line 84
    :cond_4
    invoke-direct {p0, v7}, Lorg/nibor/autolink/internal/EmailScanner;->subDomainAllowed(C)Z

    move-result v4

    if-eqz v4, :cond_5

    move v6, p2

    goto :goto_1

    :goto_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 92
    :cond_5
    :goto_3
    iget-boolean p1, p0, Lorg/nibor/autolink/internal/EmailScanner;->domainMustHaveDot:Z

    if-eqz p1, :cond_7

    if-eq v5, v2, :cond_6

    if-le v5, v6, :cond_7

    :cond_6
    return v2

    :cond_7
    return v6
.end method

.method private localAtomAllowed(C)Z
    .locals 2

    .line 101
    invoke-static {p1}, Lorg/nibor/autolink/internal/Scanners;->isAlnum(C)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-static {p1}, Lorg/nibor/autolink/internal/Scanners;->isNonAscii(C)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x21

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2f

    if-eq p1, v0, :cond_1

    const/16 v0, 0x3d

    if-eq p1, v0, :cond_1

    const/16 v0, 0x3f

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2a

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2b

    if-eq p1, v0, :cond_1

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    :pswitch_0
    return v1

    :pswitch_data_0
    .packed-switch 0x23
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x5e
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x7b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private subDomainAllowed(C)Z
    .locals 1

    .line 131
    invoke-static {p1}, Lorg/nibor/autolink/internal/Scanners;->isAlnum(C)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lorg/nibor/autolink/internal/Scanners;->isNonAscii(C)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public scan(Ljava/lang/CharSequence;II)Lorg/nibor/autolink/LinkSpan;
    .locals 2

    add-int/lit8 v0, p2, -0x1

    .line 22
    invoke-direct {p0, p1, v0, p3}, Lorg/nibor/autolink/internal/EmailScanner;->findFirst(Ljava/lang/CharSequence;II)I

    move-result p3

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-ne p3, v1, :cond_0

    return-object v0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 28
    invoke-direct {p0, p1, p2}, Lorg/nibor/autolink/internal/EmailScanner;->findLast(Ljava/lang/CharSequence;I)I

    move-result p1

    if-ne p1, v1, :cond_1

    return-object v0

    .line 33
    :cond_1
    new-instance p2, Lorg/nibor/autolink/internal/LinkSpanImpl;

    sget-object v0, Lorg/nibor/autolink/LinkType;->EMAIL:Lorg/nibor/autolink/LinkType;

    add-int/lit8 p1, p1, 0x1

    invoke-direct {p2, v0, p3, p1}, Lorg/nibor/autolink/internal/LinkSpanImpl;-><init>(Lorg/nibor/autolink/LinkType;II)V

    return-object p2
.end method
