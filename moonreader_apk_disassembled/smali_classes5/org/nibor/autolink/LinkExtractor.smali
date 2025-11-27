.class public Lorg/nibor/autolink/LinkExtractor;
.super Ljava/lang/Object;
.source "LinkExtractor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/nibor/autolink/LinkExtractor$LinkIterator;,
        Lorg/nibor/autolink/LinkExtractor$Builder;
    }
.end annotation


# instance fields
.field private final emailScanner:Lorg/nibor/autolink/internal/Scanner;

.field private final urlScanner:Lorg/nibor/autolink/internal/Scanner;

.field private final wwwScanner:Lorg/nibor/autolink/internal/Scanner;


# direct methods
.method private constructor <init>(Lorg/nibor/autolink/internal/UrlScanner;Lorg/nibor/autolink/internal/WwwScanner;Lorg/nibor/autolink/internal/EmailScanner;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lorg/nibor/autolink/LinkExtractor;->urlScanner:Lorg/nibor/autolink/internal/Scanner;

    .line 23
    iput-object p2, p0, Lorg/nibor/autolink/LinkExtractor;->wwwScanner:Lorg/nibor/autolink/internal/Scanner;

    .line 24
    iput-object p3, p0, Lorg/nibor/autolink/LinkExtractor;->emailScanner:Lorg/nibor/autolink/internal/Scanner;

    return-void
.end method

.method synthetic constructor <init>(Lorg/nibor/autolink/internal/UrlScanner;Lorg/nibor/autolink/internal/WwwScanner;Lorg/nibor/autolink/internal/EmailScanner;Lorg/nibor/autolink/LinkExtractor$1;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Lorg/nibor/autolink/LinkExtractor;-><init>(Lorg/nibor/autolink/internal/UrlScanner;Lorg/nibor/autolink/internal/WwwScanner;Lorg/nibor/autolink/internal/EmailScanner;)V

    return-void
.end method

.method static synthetic access$200(Lorg/nibor/autolink/LinkExtractor;C)Lorg/nibor/autolink/internal/Scanner;
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lorg/nibor/autolink/LinkExtractor;->trigger(C)Lorg/nibor/autolink/internal/Scanner;

    move-result-object p0

    return-object p0
.end method

.method public static builder()Lorg/nibor/autolink/LinkExtractor$Builder;
    .locals 2

    .line 28
    new-instance v0, Lorg/nibor/autolink/LinkExtractor$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/nibor/autolink/LinkExtractor$Builder;-><init>(Lorg/nibor/autolink/LinkExtractor$1;)V

    return-object v0
.end method

.method private trigger(C)Lorg/nibor/autolink/internal/Scanner;
    .locals 1

    const/16 v0, 0x3a

    if-eq p1, v0, :cond_2

    const/16 v0, 0x40

    if-eq p1, v0, :cond_1

    const/16 v0, 0x77

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 53
    :cond_0
    iget-object p1, p0, Lorg/nibor/autolink/LinkExtractor;->wwwScanner:Lorg/nibor/autolink/internal/Scanner;

    return-object p1

    .line 51
    :cond_1
    iget-object p1, p0, Lorg/nibor/autolink/LinkExtractor;->emailScanner:Lorg/nibor/autolink/internal/Scanner;

    return-object p1

    .line 49
    :cond_2
    iget-object p1, p0, Lorg/nibor/autolink/LinkExtractor;->urlScanner:Lorg/nibor/autolink/internal/Scanner;

    return-object p1
.end method


# virtual methods
.method public extractLinks(Ljava/lang/CharSequence;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/lang/Iterable<",
            "Lorg/nibor/autolink/LinkSpan;",
            ">;"
        }
    .end annotation

    .line 38
    new-instance v0, Lorg/nibor/autolink/LinkExtractor$1;

    invoke-direct {v0, p0, p1}, Lorg/nibor/autolink/LinkExtractor$1;-><init>(Lorg/nibor/autolink/LinkExtractor;Ljava/lang/CharSequence;)V

    return-object v0
.end method
