.class public Lorg/apache/http/impl/cookie/PublicSuffixListParser;
.super Ljava/lang/Object;
.source "PublicSuffixListParser.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

.field private final parser:Lorg/apache/http/conn/util/PublicSuffixListParser;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/cookie/PublicSuffixFilter;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    .line 53
    new-instance p1, Lorg/apache/http/conn/util/PublicSuffixListParser;

    invoke-direct {p1}, Lorg/apache/http/conn/util/PublicSuffixListParser;-><init>()V

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->parser:Lorg/apache/http/conn/util/PublicSuffixListParser;

    return-void
.end method


# virtual methods
.method public parse(Ljava/io/Reader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->parser:Lorg/apache/http/conn/util/PublicSuffixListParser;

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/util/PublicSuffixListParser;->parse(Ljava/io/Reader;)Lorg/apache/http/conn/util/PublicSuffixList;

    move-result-object p1

    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    invoke-virtual {p1}, Lorg/apache/http/conn/util/PublicSuffixList;->getRules()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/PublicSuffixFilter;->setPublicSuffixes(Ljava/util/Collection;)V

    .line 67
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    invoke-virtual {p1}, Lorg/apache/http/conn/util/PublicSuffixList;->getExceptions()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/cookie/PublicSuffixFilter;->setExceptions(Ljava/util/Collection;)V

    return-void
.end method
