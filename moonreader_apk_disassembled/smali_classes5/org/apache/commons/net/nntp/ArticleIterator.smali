.class Lorg/apache/commons/net/nntp/ArticleIterator;
.super Ljava/lang/Object;
.source "ArticleIterator.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lorg/apache/commons/net/nntp/Article;",
        ">;",
        "Ljava/lang/Iterable<",
        "Lorg/apache/commons/net/nntp/Article;",
        ">;"
    }
.end annotation


# instance fields
.field private final stringIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/nntp/ArticleIterator;->stringIterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 37
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ArticleIterator;->stringIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lorg/apache/commons/net/nntp/Article;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/ArticleIterator;->next()Lorg/apache/commons/net/nntp/Article;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/apache/commons/net/nntp/Article;
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ArticleIterator;->stringIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 48
    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPClient;->parseArticleEntry(Ljava/lang/String;)Lorg/apache/commons/net/nntp/Article;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ArticleIterator;->stringIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    return-void
.end method
