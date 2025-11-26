.class public Lcom/flyersoft/books/chmlib/HHCConverter;
.super Ljava/lang/Object;
.source "HHCConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/HHCConverter$State;,
        Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;,
        Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;,
        Lcom/flyersoft/books/chmlib/HHCConverter$NameType;
    }
.end annotation


# static fields
.field static final ICON_CLOSE_FOLDER:Ljava/lang/String; = "as/cf.png"

.field static final ICON_FILE:Ljava/lang/String; = "as/f.png"

.field private static count:I = 0x0

.field public static fileHHCTemplate:Ljava/lang/String; = null

.field public static final key_local:Ljava/lang/String; = "Local"

.field public static final key_name:Ljava/lang/String; = "Name"

.field private static logger:Lcom/flyersoft/books/chmlib/Logger; = null

.field public static final object:Ljava/lang/String; = "object"

.field public static final object_e:Ljava/lang/String; = "/object"

.field public static final param:Ljava/lang/String; = "param"

.field public static final ul:Ljava/lang/String; = "ul"

.field public static final ul_e:Ljava/lang/String; = "/ul"

.field public static final value_deli:Ljava/lang/String; = "/> \t\r\n"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const-string v0, "HHCConverter"

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/Logger;->getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter;->logger:Lcom/flyersoft/books/chmlib/Logger;

    .line 26
    const-string v0, "%s"

    sput-object v0, Lcom/flyersoft/books/chmlib/HHCConverter;->fileHHCTemplate:Ljava/lang/String;

    const/4 v0, 0x0

    .line 153
    sput v0, Lcom/flyersoft/books/chmlib/HHCConverter;->count:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToTree(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/io/OutputStream;Ljava/util/ArrayList;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/books/chmlib/MyBufferedReader;",
            "Ljava/io/OutputStream;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/chmlib/HHC$HChapter;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/HHC$IndexEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 39
    new-instance v1, Ljava/io/OutputStreamWriter;

    const-string v2, "UTF-8"

    invoke-direct {v1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 41
    sget-object v0, Lcom/flyersoft/books/chmlib/HHCConverter;->fileHHCTemplate:Ljava/lang/String;

    const-string v2, "%s"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 42
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter;->fileHHCTemplate:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 43
    sget-object v4, Lcom/flyersoft/books/chmlib/HHCConverter;->fileHHCTemplate:Ljava/lang/String;

    const/4 v5, 0x2

    add-int/2addr v0, v5

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-virtual {v1, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 47
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->begin:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    .line 48
    new-instance v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;

    const/4 v6, 0x0

    invoke-direct {v4, v6}, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;-><init>(Lcom/flyersoft/books/chmlib/HHCConverter-IA;)V

    .line 49
    instance-of v6, p1, Ljava/io/FileOutputStream;

    if-eqz v6, :cond_0

    .line 50
    check-cast p1, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p1

    iput-object p1, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->outChannel:Ljava/nio/channels/FileChannel;

    .line 51
    :cond_0
    sget-object p1, Lcom/flyersoft/books/chmlib/HHCConverter;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v6, "convertToTree: start"

    invoke-virtual {p1, v6}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 52
    sput v3, Lcom/flyersoft/books/chmlib/HHCConverter;->count:I

    const/4 p1, 0x0

    .line 54
    :cond_1
    :goto_0
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v6}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readNextXMLTag(Lcom/flyersoft/books/chmlib/CharArray;)I

    move-result v6

    if-lez v6, :cond_9

    .line 55
    sget v6, Lcom/flyersoft/books/chmlib/HHCConverter;->count:I

    const/4 v7, 0x1

    add-int/2addr v6, v7

    sput v6, Lcom/flyersoft/books/chmlib/HHCConverter;->count:I

    .line 56
    rem-int/lit16 v6, v6, 0x2710

    if-nez v6, :cond_2

    .line 57
    sget-object v6, Lcom/flyersoft/books/chmlib/HHCConverter;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "convertToTree: converted node:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v9, Lcom/flyersoft/books/chmlib/HHCConverter;->count:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 59
    :cond_2
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v6}, Lcom/flyersoft/books/chmlib/CharArray;->toLowerCase()V

    .line 60
    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/HHCConverter$State;->ordinal()I

    move-result v6

    const-string v8, "ul"

    if-eqz v6, :cond_8

    if-eq v6, v7, :cond_5

    if-eq v6, v5, :cond_3

    goto :goto_0

    .line 81
    :cond_3
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v7, "param"

    invoke-virtual {v6, v7}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 82
    invoke-static {p0, v4}, Lcom/flyersoft/books/chmlib/HHCConverter;->readAttributes(Lcom/flyersoft/books/chmlib/MyBufferedReader;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;)V

    goto :goto_0

    .line 83
    :cond_4
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v7, "/object"

    invoke-virtual {v6, v7}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 84
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->ul:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    goto :goto_0

    .line 66
    :cond_5
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v9, "object"

    invoke-virtual {v6, v9}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 67
    invoke-static {v3, v1, v4, p2, p1}, Lcom/flyersoft/books/chmlib/HHCConverter;->writeNode(ZLjava/io/Writer;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;Ljava/util/ArrayList;I)V

    .line 68
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->object:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    goto :goto_0

    .line 69
    :cond_6
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v6, v8}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 70
    invoke-static {v7, v1, v4, p2, p1}, Lcom/flyersoft/books/chmlib/HHCConverter;->writeNode(ZLjava/io/Writer;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;Ljava/util/ArrayList;I)V

    add-int/lit8 p1, p1, 0x1

    .line 72
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->ul:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    goto :goto_0

    .line 73
    :cond_7
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v7, "/ul"

    invoke-virtual {v6, v7}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 74
    invoke-static {v3, v1, v4, p2, p1}, Lcom/flyersoft/books/chmlib/HHCConverter;->writeNode(ZLjava/io/Writer;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;Ljava/util/ArrayList;I)V

    add-int/lit8 p1, p1, -0x1

    .line 76
    const-string v2, "</div>"

    invoke-virtual {v1, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 77
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->ul:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    goto/16 :goto_0

    .line 62
    :cond_8
    iget-object v6, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v6, v8}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 63
    sget-object v2, Lcom/flyersoft/books/chmlib/HHCConverter$State;->ul:Lcom/flyersoft/books/chmlib/HHCConverter$State;

    goto/16 :goto_0

    .line 89
    :cond_9
    invoke-virtual {v1, v0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 90
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 91
    sget-object p0, Lcom/flyersoft/books/chmlib/HHCConverter;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string p1, "convertToTree: finish"

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 92
    iget-object p0, v4, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->hhcIndex:Ljava/util/List;

    return-object p0
.end method

.method public static readAttributes(Lcom/flyersoft/books/chmlib/MyBufferedReader;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    sget-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;->unknown:Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;

    .line 100
    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->unknown:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    .line 103
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->skipSpace()V

    .line 104
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    const/16 v3, 0x2f

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eq v2, v3, :cond_8

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_0

    goto/16 :goto_4

    .line 109
    :cond_0
    const-string v2, "="

    iget-object v3, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v2, v3}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;Lcom/flyersoft/books/chmlib/CharArray;)I

    .line 110
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/CharArray;->toLowerCase()V

    .line 111
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v3, "name"

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 112
    sget-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;->name:Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;

    goto :goto_1

    .line 113
    :cond_1
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v3, "value"

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 114
    sget-object v0, Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;->value:Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;

    .line 117
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    .line 119
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v2

    const/16 v3, 0x27

    if-ne v2, v3, :cond_3

    .line 121
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    .line 122
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v3, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(CLcom/flyersoft/books/chmlib/CharArray;)I

    .line 123
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    goto :goto_2

    :cond_3
    const/16 v3, 0x22

    if-ne v2, v3, :cond_4

    .line 125
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    .line 126
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v3, v2}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(CLcom/flyersoft/books/chmlib/CharArray;)I

    .line 127
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    goto :goto_2

    .line 129
    :cond_4
    const-string v2, "/> \t\r\n"

    iget-object v3, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v2, v3}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;Lcom/flyersoft/books/chmlib/CharArray;)I

    .line 131
    :goto_2
    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/HHCConverter$KeyType;->ordinal()I

    move-result v2

    if-eq v2, v5, :cond_5

    if-eq v2, v4, :cond_7

    goto :goto_0

    .line 133
    :cond_5
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v3, "Name"

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 134
    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->name:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    goto :goto_3

    .line 135
    :cond_6
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v3, "Local"

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/CharArray;->equals(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 136
    sget-object v1, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->local:Lcom/flyersoft/books/chmlib/HHCConverter$NameType;

    .line 138
    :cond_7
    :goto_3
    iget-object v2, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTempValue:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object v3, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTemp:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v2, v3}, Lcom/flyersoft/books/chmlib/CharArray;->copyFrom(Lcom/flyersoft/books/chmlib/CharArray;)V

    goto/16 :goto_0

    .line 142
    :cond_8
    :goto_4
    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/HHCConverter$NameType;->ordinal()I

    move-result p0

    if-eq p0, v5, :cond_a

    if-eq p0, v4, :cond_9

    return-void

    .line 147
    :cond_9
    iget-object p0, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object v0, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTempValue:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/CharArray;->copyFrom(Lcom/flyersoft/books/chmlib/CharArray;)V

    .line 148
    iget-object p0, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    const-string v0, "%20"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/books/chmlib/CharArray;->replace(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p0

    iput-object p0, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    return-void

    .line 144
    :cond_a
    iget-object p0, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caTempValue:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/CharArray;->copyFrom(Lcom/flyersoft/books/chmlib/CharArray;)V

    return-void
.end method

.method private static writeNode(ZLjava/io/Writer;Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;Ljava/util/ArrayList;I)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/io/Writer;",
            "Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/chmlib/HHC$HChapter;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    iget v0, v0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-nez v0, :cond_0

    return-void

    .line 162
    :cond_0
    new-instance v0, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;-><init>()V

    .line 163
    iget-object v1, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/CharArray;->hashCode()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    .line 164
    iget-object v1, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->hhcIndex:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->id:I

    .line 165
    iget-object v1, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->hhcIndex:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;

    invoke-direct {v1}, Lcom/flyersoft/books/chmlib/HHC$HChapter;-><init>()V

    .line 168
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    iput-boolean p0, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->hasSubChapter:Z

    .line 170
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3}, Lcom/flyersoft/books/chmlib/CharArray;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->name:Ljava/lang/String;

    .line 171
    iput p4, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->indent:I

    if-eqz p0, :cond_1

    .line 174
    const-string p3, "as/cf.png"

    goto :goto_0

    :cond_1
    const-string p3, "as/f.png"

    .line 177
    :goto_0
    iget p4, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->id:I

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p4

    .line 178
    iget-object v2, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    iget v2, v2, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    const-string v3, " onclick=tn("

    const-string v4, " class=ic src="

    const-string v5, "><img id=ic_"

    const-string v6, " /><div id=n_"

    const-string v7, "<a name="

    const/4 v8, 0x0

    if-nez v2, :cond_2

    .line 179
    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    invoke-virtual {p3, v3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    .line 180
    invoke-virtual {p3, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    const-string v0, ") />"

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    const-string v0, "</div>\n"

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    .line 181
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object p3, p3, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget v0, v0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1, p3, v8, v0}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_1

    .line 184
    :cond_2
    iget-object v2, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    const/16 v9, 0x27

    invoke-virtual {v2, v9}, Lcom/flyersoft/books/chmlib/CharArray;->indexOf(C)I

    move-result v2

    if-ltz v2, :cond_3

    const/16 v9, 0x22

    .line 187
    :cond_3
    iget-object v2, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {v2}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, v7}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    invoke-virtual {p3, v3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    .line 188
    invoke-virtual {p3, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    const-string v2, ") /><a href="

    invoke-virtual {p3, v2}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    invoke-virtual {p3, v9}, Lcom/flyersoft/books/chmlib/CharArray;->a(C)Lcom/flyersoft/books/chmlib/CharArray;

    .line 189
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object p3, p3, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget-object v2, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget v2, v2, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1, p3, v8, v2}, Ljava/io/Writer;->write([CII)V

    .line 190
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 191
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->outChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {p3}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->position:J

    .line 195
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    invoke-virtual {p3, v9}, Lcom/flyersoft/books/chmlib/CharArray;->a(C)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    const-string v0, ">"

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p3

    const-string v0, "</a></div>\n"

    invoke-virtual {p3, v0}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    .line 196
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object p3, p3, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget-object v0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget v0, v0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1, p3, v8, v0}, Ljava/io/Writer;->write([CII)V

    .line 197
    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p3}, Lcom/flyersoft/books/chmlib/CharArray;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, v1, Lcom/flyersoft/books/chmlib/HHC$HChapter;->filename:Ljava/lang/String;

    :goto_1
    if-eqz p0, :cond_4

    .line 203
    iget-object p0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p0

    const-string p3, "<div id=c_"

    invoke-virtual {p0, p3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p0

    invoke-virtual {p0, p4}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p0

    const-string p3, " class=c style=display:none;>\n"

    invoke-virtual {p0, p3}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    .line 204
    iget-object p0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget-object p0, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget-object p3, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->caWriteBuffer:Lcom/flyersoft/books/chmlib/CharArray;

    iget p3, p3, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1, p0, v8, p3}, Ljava/io/Writer;->write([CII)V

    .line 207
    :cond_4
    iget-object p0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->fileName:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    .line 208
    iget-object p0, p2, Lcom/flyersoft/books/chmlib/HHCConverter$ParsingContext;->name:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    return-void
.end method
