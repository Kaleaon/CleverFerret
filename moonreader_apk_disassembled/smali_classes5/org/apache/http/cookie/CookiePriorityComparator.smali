.class public Lorg/apache/http/cookie/CookiePriorityComparator;
.super Ljava/lang/Object;
.source "CookiePriorityComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lorg/apache/http/cookie/Cookie;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/cookie/CookiePriorityComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lorg/apache/http/cookie/CookiePriorityComparator;

    invoke-direct {v0}, Lorg/apache/http/cookie/CookiePriorityComparator;-><init>()V

    sput-object v0, Lorg/apache/http/cookie/CookiePriorityComparator;->INSTANCE:Lorg/apache/http/cookie/CookiePriorityComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getPathLength(Lorg/apache/http/cookie/Cookie;)I
    .locals 0

    .line 50
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 44
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    check-cast p2, Lorg/apache/http/cookie/Cookie;

    invoke-virtual {p0, p1, p2}, Lorg/apache/http/cookie/CookiePriorityComparator;->compare(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/Cookie;)I

    move-result p1

    return p1
.end method

.method public compare(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/Cookie;)I
    .locals 2

    .line 56
    invoke-direct {p0, p1}, Lorg/apache/http/cookie/CookiePriorityComparator;->getPathLength(Lorg/apache/http/cookie/Cookie;)I

    move-result v0

    .line 57
    invoke-direct {p0, p2}, Lorg/apache/http/cookie/CookiePriorityComparator;->getPathLength(Lorg/apache/http/cookie/Cookie;)I

    move-result v1

    sub-int/2addr v1, v0

    if-nez v1, :cond_0

    .line 60
    instance-of v0, p1, Lorg/apache/http/impl/cookie/BasicClientCookie;

    if-eqz v0, :cond_0

    instance-of v0, p2, Lorg/apache/http/impl/cookie/BasicClientCookie;

    if-eqz v0, :cond_0

    .line 61
    check-cast p1, Lorg/apache/http/impl/cookie/BasicClientCookie;

    invoke-virtual {p1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->getCreationDate()Ljava/util/Date;

    move-result-object p1

    .line 62
    check-cast p2, Lorg/apache/http/impl/cookie/BasicClientCookie;

    invoke-virtual {p2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->getCreationDate()Ljava/util/Date;

    move-result-object p2

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 64
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    sub-long/2addr v0, p1

    long-to-int p1, v0

    return p1

    :cond_0
    return v1
.end method
