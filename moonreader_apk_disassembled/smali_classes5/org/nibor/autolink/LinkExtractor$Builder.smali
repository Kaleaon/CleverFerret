.class public Lorg/nibor/autolink/LinkExtractor$Builder;
.super Ljava/lang/Object;
.source "LinkExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/nibor/autolink/LinkExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private emailDomainMustHaveDot:Z

.field private linkTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/nibor/autolink/LinkType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const-class v0, Lorg/nibor/autolink/LinkType;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes:Ljava/util/Set;

    const/4 v0, 0x1

    .line 64
    iput-boolean v0, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->emailDomainMustHaveDot:Z

    return-void
.end method

.method synthetic constructor <init>(Lorg/nibor/autolink/LinkExtractor$1;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lorg/nibor/autolink/LinkExtractor$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lorg/nibor/autolink/LinkExtractor;
    .locals 5

    .line 95
    iget-object v0, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes:Ljava/util/Set;

    sget-object v1, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/nibor/autolink/internal/UrlScanner;

    invoke-direct {v0}, Lorg/nibor/autolink/internal/UrlScanner;-><init>()V

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 96
    :goto_0
    iget-object v2, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes:Ljava/util/Set;

    sget-object v3, Lorg/nibor/autolink/LinkType;->WWW:Lorg/nibor/autolink/LinkType;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Lorg/nibor/autolink/internal/WwwScanner;

    invoke-direct {v2}, Lorg/nibor/autolink/internal/WwwScanner;-><init>()V

    goto :goto_1

    :cond_1
    move-object v2, v1

    .line 97
    :goto_1
    iget-object v3, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes:Ljava/util/Set;

    sget-object v4, Lorg/nibor/autolink/LinkType;->EMAIL:Lorg/nibor/autolink/LinkType;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Lorg/nibor/autolink/internal/EmailScanner;

    iget-boolean v4, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->emailDomainMustHaveDot:Z

    invoke-direct {v3, v4}, Lorg/nibor/autolink/internal/EmailScanner;-><init>(Z)V

    goto :goto_2

    :cond_2
    move-object v3, v1

    .line 98
    :goto_2
    new-instance v4, Lorg/nibor/autolink/LinkExtractor;

    invoke-direct {v4, v0, v2, v3, v1}, Lorg/nibor/autolink/LinkExtractor;-><init>(Lorg/nibor/autolink/internal/UrlScanner;Lorg/nibor/autolink/internal/WwwScanner;Lorg/nibor/autolink/internal/EmailScanner;Lorg/nibor/autolink/LinkExtractor$1;)V

    return-object v4
.end method

.method public emailDomainMustHaveDot(Z)Lorg/nibor/autolink/LinkExtractor$Builder;
    .locals 0

    .line 87
    iput-boolean p1, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->emailDomainMustHaveDot:Z

    return-object p0
.end method

.method public linkTypes(Ljava/util/Set;)Lorg/nibor/autolink/LinkExtractor$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lorg/nibor/autolink/LinkType;",
            ">;)",
            "Lorg/nibor/autolink/LinkExtractor$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 77
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes:Ljava/util/Set;

    return-object p0

    .line 75
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "linkTypes must not be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
