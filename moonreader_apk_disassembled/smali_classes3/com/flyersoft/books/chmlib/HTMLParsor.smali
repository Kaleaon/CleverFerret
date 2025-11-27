.class public Lcom/flyersoft/books/chmlib/HTMLParsor;
.super Ljava/lang/Object;
.source "HTMLParsor.java"


# static fields
.field private static attributeMap:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/books/chmlib/HTMLParsor;->attributeMap:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1

    .line 154
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static parse(Lcom/flyersoft/books/chmlib/MyBufferedReader;)Lcom/flyersoft/books/chmlib/XMLNode;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    new-instance v0, Lcom/flyersoft/books/chmlib/XMLNode;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/XMLNode;-><init>()V

    const/16 v1, 0x3c

    .line 16
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 17
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    :goto_0
    const/16 v3, 0x21

    if-eq v2, v3, :cond_1

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_0

    goto :goto_1

    .line 25
    :cond_0
    invoke-static {p0, v0}, Lcom/flyersoft/books/chmlib/HTMLParsor;->parse(Lcom/flyersoft/books/chmlib/MyBufferedReader;Lcom/flyersoft/books/chmlib/XMLNode;)Lcom/flyersoft/books/chmlib/XMLNode;

    return-object v0

    :cond_1
    :goto_1
    const/16 v2, 0x3e

    .line 19
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 20
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 21
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    goto :goto_0
.end method

.method public static parse(Lcom/flyersoft/books/chmlib/MyBufferedReader;Lcom/flyersoft/books/chmlib/XMLNode;)Lcom/flyersoft/books/chmlib/XMLNode;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 41
    :try_start_0
    new-instance v1, Lcom/flyersoft/books/chmlib/XMLNode;

    invoke-direct {v1}, Lcom/flyersoft/books/chmlib/XMLNode;-><init>()V

    .line 42
    const-string v2, "/> \t\r\n"

    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/XMLNode;->setTag(Ljava/lang/String;)V

    .line 45
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-eqz v2, :cond_0

    :goto_0
    if-eqz p1, :cond_0

    .line 46
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v2, v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->childTags:Ljava/util/Set;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/XMLNode;->tag:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 47
    iget-object p1, p1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p1, v1}, Lcom/flyersoft/books/chmlib/XMLNode;->addChild(Lcom/flyersoft/books/chmlib/XMLNode;)V

    .line 51
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skipSpace()V

    .line 54
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    .line 55
    sget-object v3, Lcom/flyersoft/books/chmlib/HTMLParsor;->attributeMap:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    :goto_1
    const/16 v3, 0x3e

    const/16 v4, 0x2f

    const-wide/16 v5, 0x1

    if-eq v2, v4, :cond_6

    if-eq v2, v3, :cond_6

    .line 57
    const-string v2, "=/> \t\r\n"

    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skipSpace()V

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v7

    if-eq v7, v4, :cond_5

    if-ne v7, v3, :cond_1

    goto :goto_3

    :cond_1
    const/16 v3, 0x3d

    if-ne v7, v3, :cond_4

    .line 68
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 69
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skipSpace()V

    .line 70
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_2

    .line 72
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 73
    invoke-virtual {p0, v4}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(C)Ljava/lang/String;

    move-result-object v3

    .line 74
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    goto :goto_2

    :cond_2
    const/16 v4, 0x22

    if-ne v3, v4, :cond_3

    .line 76
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 77
    invoke-virtual {p0, v4}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(C)Ljava/lang/String;

    move-result-object v3

    .line 78
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    goto :goto_2

    .line 80
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntilSpaces()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_4
    move-object v3, v0

    .line 83
    :goto_2
    sget-object v4, Lcom/flyersoft/books/chmlib/HTMLParsor;->attributeMap:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    sget-object v2, Lcom/flyersoft/books/chmlib/HTMLParsor;->attributeMap:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skipSpace()V

    .line 87
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    goto :goto_1

    .line 61
    :cond_5
    :goto_3
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    move v2, v7

    .line 89
    :cond_6
    sget-object v7, Lcom/flyersoft/books/chmlib/HTMLParsor;->attributeMap:Ljava/util/List;

    invoke-virtual {v1, v7}, Lcom/flyersoft/books/chmlib/XMLNode;->setAttributes(Ljava/util/List;)V

    if-ne v2, v4, :cond_7

    const-wide/16 v2, 0x2

    .line 92
    invoke-virtual {p0, v2, v3}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 93
    iget-object p0, v1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    return-object p0

    .line 96
    :cond_7
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    const/16 v2, 0x3c

    .line 97
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Lcom/flyersoft/books/chmlib/XMLNode;->text:Ljava/lang/String;

    .line 98
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->eof()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 99
    iget-object p0, v1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    return-object p0

    .line 101
    :cond_8
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 102
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v7

    :goto_4
    if-eq v7, v4, :cond_c

    const/16 v8, 0x21

    if-ne v7, v8, :cond_a

    .line 106
    invoke-virtual {p0, v3}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 107
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->eof()Z

    move-result v7

    if-nez v7, :cond_9

    .line 108
    iget-object p0, v1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    return-object p0

    .line 109
    :cond_9
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 110
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v7

    goto :goto_4

    .line 115
    :cond_a
    invoke-static {p0, v1}, Lcom/flyersoft/books/chmlib/HTMLParsor;->parse(Lcom/flyersoft/books/chmlib/MyBufferedReader;Lcom/flyersoft/books/chmlib/XMLNode;)Lcom/flyersoft/books/chmlib/XMLNode;

    move-result-object v7

    if-eq v7, v1, :cond_b

    .line 118
    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/XMLNode;->compact()V

    return-object v7

    .line 121
    :cond_b
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    .line 122
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v7

    goto :goto_4

    :cond_c
    if-ne v7, v4, :cond_e

    .line 126
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 127
    invoke-virtual {p0, v3}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 128
    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skip(J)J

    .line 130
    :goto_5
    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/XMLNode;->getTagStr()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    .line 131
    iget-object v1, v1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;

    goto :goto_5

    .line 133
    :cond_d
    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/XMLNode;->compact()V

    .line 134
    iget-object p0, v1, Lcom/flyersoft/books/chmlib/XMLNode;->parent:Lcom/flyersoft/books/chmlib/XMLNode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :cond_e
    return-object p1

    :catchall_0
    return-object v0
.end method
