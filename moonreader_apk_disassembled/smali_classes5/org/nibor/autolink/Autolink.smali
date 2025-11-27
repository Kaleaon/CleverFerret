.class public Lorg/nibor/autolink/Autolink;
.super Ljava/lang/Object;
.source "Autolink.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static renderLinks(Ljava/lang/CharSequence;Ljava/lang/Iterable;Lorg/nibor/autolink/LinkRenderer;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Iterable<",
            "Lorg/nibor/autolink/LinkSpan;",
            ">;",
            "Lorg/nibor/autolink/LinkRenderer;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 20
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/nibor/autolink/LinkSpan;

    .line 21
    invoke-interface {v2}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v3

    invoke-virtual {v0, p0, v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 22
    invoke-interface {p2, v2, p0, v0}, Lorg/nibor/autolink/LinkRenderer;->render(Lorg/nibor/autolink/LinkSpan;Ljava/lang/CharSequence;Ljava/lang/StringBuilder;)V

    .line 23
    invoke-interface {v2}, Lorg/nibor/autolink/LinkSpan;->getEndIndex()I

    move-result v1

    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-ge v1, p1, :cond_1

    .line 26
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {v0, p0, v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 28
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
