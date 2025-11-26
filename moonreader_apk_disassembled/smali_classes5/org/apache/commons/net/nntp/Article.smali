.class public Lorg/apache/commons/net/nntp/Article;
.super Ljava/lang/Object;
.source "Article.java"

# interfaces
.implements Lorg/apache/commons/net/nntp/Threadable;


# instance fields
.field private articleId:Ljava/lang/String;

.field private articleNumber:J

.field private date:Ljava/lang/String;

.field private from:Ljava/lang/String;

.field private isReply:Z

.field public kid:Lorg/apache/commons/net/nntp/Article;

.field public next:Lorg/apache/commons/net/nntp/Article;

.field private references:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private simplifiedSubject:Ljava/lang/String;

.field private subject:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 43
    iput-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    return-void
.end method

.method private flushSubjectCache()V
    .locals 1

    const/4 v0, 0x0

    .line 267
    iput-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    return-void
.end method

.method public static printThread(Lorg/apache/commons/net/nntp/Article;)V
    .locals 2

    const/4 v0, 0x0

    .line 144
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0, v0, v1}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;ILjava/io/PrintStream;)V

    return-void
.end method

.method public static printThread(Lorg/apache/commons/net/nntp/Article;I)V
    .locals 1

    .line 165
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;ILjava/io/PrintStream;)V

    return-void
.end method

.method public static printThread(Lorg/apache/commons/net/nntp/Article;ILjava/io/PrintStream;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 178
    const-string v1, "==>"

    invoke-virtual {p2, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 180
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getSubject()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getArticleId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 181
    iget-object p2, p0, Lorg/apache/commons/net/nntp/Article;->kid:Lorg/apache/commons/net/nntp/Article;

    if-eqz p2, :cond_1

    add-int/lit8 v0, p1, 0x1

    .line 182
    invoke-static {p2, v0}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;I)V

    .line 184
    :cond_1
    iget-object p0, p0, Lorg/apache/commons/net/nntp/Article;->next:Lorg/apache/commons/net/nntp/Article;

    if-eqz p0, :cond_2

    .line 185
    invoke-static {p0, p1}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;I)V

    :cond_2
    return-void
.end method

.method public static printThread(Lorg/apache/commons/net/nntp/Article;Ljava/io/PrintStream;)V
    .locals 1

    const/4 v0, 0x0

    .line 155
    invoke-static {p0, v0, p1}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;ILjava/io/PrintStream;)V

    return-void
.end method

.method private simplifySubject()V
    .locals 9

    .line 77
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getSubject()Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-nez v3, :cond_b

    :goto_1
    const/16 v3, 0x20

    if-ge v4, v1, :cond_0

    .line 87
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v3, :cond_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v1, -0x2

    if-ge v4, v5, :cond_7

    .line 92
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x72

    if-eq v6, v7, :cond_1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x52

    if-ne v6, v7, :cond_7

    :cond_1
    add-int/lit8 v6, v4, 0x1

    .line 93
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x65

    if-eq v7, v8, :cond_2

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x45

    if-ne v6, v7, :cond_7

    :cond_2
    add-int/lit8 v6, v4, 0x2

    .line 95
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x3a

    if-ne v7, v8, :cond_3

    add-int/lit8 v4, v4, 0x3

    :goto_2
    const/4 v5, 0x0

    goto :goto_4

    :cond_3
    if-ge v4, v5, :cond_7

    .line 101
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x5b

    if-eq v5, v7, :cond_4

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x28

    if-ne v5, v6, :cond_7

    :cond_4
    add-int/lit8 v5, v4, 0x3

    :goto_3
    if-ge v5, v1, :cond_5

    .line 105
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x30

    if-lt v6, v7, :cond_5

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x39

    if-gt v6, v7, :cond_5

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_5
    add-int/lit8 v6, v1, -0x1

    if-ge v5, v6, :cond_7

    .line 110
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5d

    if-eq v6, v7, :cond_6

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x29

    if-ne v6, v7, :cond_7

    :cond_6
    add-int/lit8 v6, v5, 0x1

    .line 111
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v8, :cond_7

    add-int/lit8 v5, v5, 0x2

    move v4, v5

    goto :goto_2

    :cond_7
    const/4 v5, 0x1

    .line 119
    :goto_4
    const-string v6, "(no subject)"

    iget-object v7, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 120
    const-string v6, ""

    iput-object v6, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    :cond_8
    move v6, v1

    :goto_5
    if-le v6, v4, :cond_9

    add-int/lit8 v7, v6, -0x1

    .line 125
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ge v7, v3, :cond_9

    add-int/lit8 v6, v6, -0x1

    goto :goto_5

    :cond_9
    if-nez v4, :cond_a

    if-ne v6, v1, :cond_a

    .line 130
    iput-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    goto :goto_6

    .line 132
    :cond_a
    invoke-virtual {v0, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    :goto_6
    move v3, v5

    goto/16 :goto_0

    :cond_b
    return-void
.end method


# virtual methods
.method public addHeaderField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public addReference(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_2

    .line 50
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    :cond_1
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lorg/apache/commons/net/nntp/Article;->isReply:Z

    .line 57
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    return-void
.end method

.method public getArticleId()Ljava/lang/String;
    .locals 1

    .line 190
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    return-object v0
.end method

.method public getArticleNumber()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 292
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    long-to-int v1, v0

    return v1
.end method

.method public getArticleNumberLong()J
    .locals 2

    .line 194
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    return-wide v0
.end method

.method public getDate()Ljava/lang/String;
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->date:Ljava/lang/String;

    return-object v0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    .line 202
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->from:Ljava/lang/String;

    return-object v0
.end method

.method public getReferences()[Ljava/lang/String;
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 66
    sget-object v0, Lorg/apache/commons/net/util/NetConstants;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object v0

    .line 68
    :cond_0
    sget-object v1, Lorg/apache/commons/net/util/NetConstants;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .line 206
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public isDummy()Z
    .locals 5

    .line 232
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public makeDummy()Lorg/apache/commons/net/nntp/Threadable;
    .locals 1

    .line 280
    new-instance v0, Lorg/apache/commons/net/nntp/Article;

    invoke-direct {v0}, Lorg/apache/commons/net/nntp/Article;-><init>()V

    return-object v0
.end method

.method public messageThreadId()Ljava/lang/String;
    .locals 1

    .line 237
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    return-object v0
.end method

.method public messageThreadReferences()[Ljava/lang/String;
    .locals 1

    .line 242
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getReferences()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setArticleId(Ljava/lang/String;)V
    .locals 0

    .line 210
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    return-void
.end method

.method public setArticleNumber(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p1

    .line 297
    iput-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    return-void
.end method

.method public setArticleNumber(J)V
    .locals 0

    .line 214
    iput-wide p1, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    return-void
.end method

.method public setChild(Lorg/apache/commons/net/nntp/Threadable;)V
    .locals 0

    .line 262
    check-cast p1, Lorg/apache/commons/net/nntp/Article;

    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->kid:Lorg/apache/commons/net/nntp/Article;

    .line 263
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->flushSubjectCache()V

    return-void
.end method

.method public setDate(Ljava/lang/String;)V
    .locals 0

    .line 218
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->date:Ljava/lang/String;

    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 222
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->from:Ljava/lang/String;

    return-void
.end method

.method public setNext(Lorg/apache/commons/net/nntp/Threadable;)V
    .locals 0

    .line 273
    check-cast p1, Lorg/apache/commons/net/nntp/Article;

    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->next:Lorg/apache/commons/net/nntp/Article;

    .line 274
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->flushSubjectCache()V

    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0

    .line 226
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    return-void
.end method

.method public simplifiedSubject()Ljava/lang/String;
    .locals 1

    .line 247
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 248
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->simplifySubject()V

    .line 250
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    return-object v0
.end method

.method public subjectIsReply()Z
    .locals 1

    .line 256
    iget-boolean v0, p0, Lorg/apache/commons/net/nntp/Article;->isReply:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
