.class public Lcom/vladsch/flexmark/util/DelimitedBuilder;
.super Ljava/lang/Object;
.source "DelimitedBuilder.java"


# instance fields
.field private delimiter:Ljava/lang/String;

.field private delimiterStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private hadSome:Z

.field private lastLen:I

.field private out:Ljava/lang/StringBuilder;

.field private pending:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 37
    const-string v0, ","

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->hadSome:Z

    .line 32
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    .line 33
    iput v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->lastLen:I

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    .line 45
    iput-object p1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    if-nez p2, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    :goto_0
    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    return-void
.end method

.method private doPending()V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    .line 111
    :cond_0
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    .line 113
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    :cond_1
    return-void
.end method

.method private had()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 0

    return-object p0
.end method


# virtual methods
.method public append(C)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 124
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 125
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(D)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 154
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 155
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 156
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(F)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 148
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 150
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(I)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 130
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 131
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(J)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 142
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 144
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    if-eqz p1, :cond_0

    .line 176
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 177
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 178
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 180
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    if-eqz p1, :cond_0

    if-ge p2, p3, :cond_0

    .line 185
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 186
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 188
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    if-eqz p1, :cond_0

    .line 160
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 161
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 162
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/String;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    if-eqz p1, :cond_0

    if-ge p2, p3, :cond_0

    .line 169
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 170
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 172
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(Z)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 136
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 137
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 138
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append([C)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 192
    array-length v0, p1

    if-lez v0, :cond_0

    .line 193
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 194
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 196
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append([CII)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    if-ge p2, p3, :cond_0

    .line 201
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 202
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 204
    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public appendAll(Ljava/lang/String;Ljava/util/List;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+TV;>;)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 256
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll(Ljava/lang/String;Ljava/util/List;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public appendAll(Ljava/lang/String;Ljava/util/List;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+TV;>;II)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    .line 260
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 261
    :goto_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->push(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 262
    invoke-virtual {p0, p2, p3, p4}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll(Ljava/util/List;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 263
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pop()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 265
    iget-object p1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    :cond_1
    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object p0

    .line 266
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->unmark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object p0
.end method

.method public appendAll(Ljava/lang/String;[Ljava/lang/Object;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[TV;)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 227
    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll(Ljava/lang/String;[Ljava/lang/Object;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public appendAll(Ljava/lang/String;[Ljava/lang/Object;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[TV;II)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 232
    :goto_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->push(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 233
    invoke-virtual {p0, p2, p3, p4}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll([Ljava/lang/Object;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 234
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pop()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 236
    iget-object p1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    :cond_1
    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object p0

    .line 237
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->unmark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object p0
.end method

.method public appendAll(Ljava/util/List;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TV;>;)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 243
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll(Ljava/util/List;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public appendAll(Ljava/util/List;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TV;>;II)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    :goto_0
    if-ge p2, p3, :cond_0

    .line 248
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 249
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 250
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public appendAll([Ljava/lang/Object;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">([TV;)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 214
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->appendAll([Ljava/lang/Object;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public appendAll([Ljava/lang/Object;II)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">([TV;II)",
            "Lcom/vladsch/flexmark/util/DelimitedBuilder;"
        }
    .end annotation

    :goto_0
    if-ge p2, p3, :cond_0

    .line 219
    aget-object v0, p1, p2

    .line 220
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 221
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public appendCodePoint(I)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 208
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->doPending()V

    .line 209
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 210
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->had()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object p1

    return-object p1
.end method

.method public clear()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    const/4 v0, 0x0

    .line 67
    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->unmark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object p0
.end method

.method public getAndClear()Ljava/lang/String;
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Delimiter stack is not empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 62
    :goto_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->clear()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 56
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public mark()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 79
    :goto_0
    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    iget v3, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->lastLen:I

    if-eq v3, v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    or-int/2addr v1, v2

    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    .line 80
    iput v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->lastLen:I

    return-object p0
.end method

.method public pop()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    return-object p0

    .line 103
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Nothing on the delimiter stack"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public push()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->push(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;

    move-result-object v0

    return-object v0
.end method

.method public push(Ljava/lang/String;)Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2

    .line 95
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/DelimitedBuilder;->unmark()Lcom/vladsch/flexmark/util/DelimitedBuilder;

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iput-object p1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiter:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Delimiter stack is not empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-nez v0, :cond_2

    const-string v0, ""

    return-object v0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringOrNull()Ljava/lang/String;
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->delimiterStack:Ljava/util/Stack;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Delimiter stack is not empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-nez v0, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unmark()Lcom/vladsch/flexmark/util/DelimitedBuilder;
    .locals 2

    const/4 v0, 0x0

    .line 85
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->pending:Z

    .line 86
    iget-object v1, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->out:Ljava/lang/StringBuilder;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    :cond_0
    iput v0, p0, Lcom/vladsch/flexmark/util/DelimitedBuilder;->lastLen:I

    return-object p0
.end method
