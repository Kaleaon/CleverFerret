.class public Lcom/rtfparserkit/parser/raw/RawRtfParser;
.super Ljava/lang/Object;
.source "RawRtfParser.java"

# interfaces
.implements Lcom/rtfparserkit/parser/IRtfParser;


# static fields
.field private static final MAX_COMMAND_LENGTH:I = 0x1e

.field private static final MAX_PARAMETER_LENGTH:I = 0x14


# instance fields
.field private buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

.field private groupDepth:I

.field private listener:Lcom/rtfparserkit/parser/IRtfListener;

.field private parsingHex:Z

.field private source:Lcom/rtfparserkit/parser/IRtfSource;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private handleBinaryData(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 315
    new-array v0, p1, [B

    .line 316
    iget-object v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v1, v0}, Lcom/rtfparserkit/parser/IRtfSource;->read([B)I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 321
    iget-object p1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {p1, v0}, Lcom/rtfparserkit/parser/IRtfListener;->processBinaryBytes([B)V

    return-void

    .line 319
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method private handleCharacterByte(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-boolean v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->parsingHex:Z

    if-eqz v0, :cond_2

    .line 132
    invoke-static {p1}, Lcom/rtfparserkit/utils/HexUtils;->parseHexDigit(I)I

    move-result p1

    shl-int/lit8 p1, p1, 0x4

    .line 133
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v0}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_0

    shr-int/lit8 p1, p1, 0x4

    .line 147
    iget-object v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v1, v0}, Lcom/rtfparserkit/parser/IRtfSource;->unread(I)V

    goto :goto_0

    .line 151
    :cond_0
    invoke-static {v0}, Lcom/rtfparserkit/utils/HexUtils;->parseHexDigit(I)I

    move-result v0

    add-int/2addr p1, v0

    .line 154
    :goto_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

    invoke-virtual {v0, p1}, Lcom/rtfparserkit/parser/raw/ByteBuffer;->add(I)V

    const/4 p1, 0x0

    .line 155
    iput-boolean p1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->parsingHex:Z

    return-void

    .line 136
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unexpected end of file"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 159
    :cond_2
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

    invoke-virtual {v0, p1}, Lcom/rtfparserkit/parser/raw/ByteBuffer;->add(I)V

    return-void
.end method

.method private handleCharacterData()V
    .locals 2

    .line 305
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

    invoke-virtual {v0}, Lcom/rtfparserkit/parser/raw/ByteBuffer;->toArray()[B

    move-result-object v0

    .line 306
    iget-object v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

    invoke-virtual {v1}, Lcom/rtfparserkit/parser/raw/ByteBuffer;->clear()V

    .line 307
    iget-object v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {v1, v0}, Lcom/rtfparserkit/parser/IRtfListener;->processCharacterBytes([B)V

    return-void
.end method

.method private handleCommand()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v2}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_e

    int-to-char v4, v2

    .line 180
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 182
    invoke-static {v2}, Ljava/lang/Character;->isLetter(I)Z

    move-result v2

    const/4 v4, 0x0

    if-nez v2, :cond_0

    .line 184
    invoke-direct {p0, v0, v4, v4}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCommand(Ljava/lang/StringBuilder;IZ)V

    return-void

    .line 190
    :cond_0
    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v2}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v2

    const/16 v5, 0x1e

    if-eq v2, v3, :cond_2

    .line 191
    invoke-static {v2}, Ljava/lang/Character;->isLetter(I)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_0

    :cond_1
    int-to-char v6, v2

    .line 195
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-le v6, v5, :cond_0

    :cond_2
    :goto_0
    if-eq v2, v3, :cond_d

    .line 207
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-gt v6, v5, :cond_c

    const/16 v5, 0x2d

    const/4 v6, 0x1

    if-ne v2, v5, :cond_4

    .line 215
    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v2}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v2

    if-eq v2, v3, :cond_3

    const/4 v5, 0x1

    goto :goto_1

    .line 218
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_4
    const/4 v5, 0x0

    .line 221
    :goto_1
    invoke-static {v2}, Ljava/lang/Character;->isDigit(I)Z

    move-result v7

    if-eqz v7, :cond_a

    int-to-char v2, v2

    .line 224
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 227
    :cond_5
    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v2}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v2

    const/16 v4, 0x14

    if-eq v2, v3, :cond_7

    .line 228
    invoke-static {v2}, Ljava/lang/Character;->isDigit(I)Z

    move-result v7

    if-nez v7, :cond_6

    goto :goto_2

    :cond_6
    int-to-char v7, v2

    .line 232
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 233
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-le v7, v4, :cond_5

    .line 239
    :cond_7
    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-gt v3, v4, :cond_9

    .line 244
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-eqz v5, :cond_8

    neg-int v4, v4

    :cond_8
    move v1, v4

    const/4 v4, 0x1

    goto :goto_3

    .line 241
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid parameter: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    const/4 v1, 0x0

    :goto_3
    const/16 v3, 0x20

    if-eq v2, v3, :cond_b

    .line 253
    iget-object v3, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    invoke-interface {v3, v2}, Lcom/rtfparserkit/parser/IRtfSource;->unread(I)V

    .line 256
    :cond_b
    invoke-direct {p0, v0, v1, v4}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCommand(Ljava/lang/StringBuilder;IZ)V

    return-void

    .line 209
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid keyword: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_d
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 177
    :cond_e
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method private handleCommand(Ljava/lang/StringBuilder;IZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 264
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 265
    invoke-static {p1}, Lcom/rtfparserkit/rtf/Command;->getInstance(Ljava/lang/String;)Lcom/rtfparserkit/rtf/Command;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 272
    sget-object v0, Lcom/rtfparserkit/rtf/Command;->hex:Lcom/rtfparserkit/rtf/Command;

    if-eq p1, v0, :cond_0

    .line 274
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCharacterData()V

    .line 277
    :cond_0
    sget-object v0, Lcom/rtfparserkit/parser/raw/RawRtfParser$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    invoke-virtual {p1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    .line 293
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/rtfparserkit/parser/IRtfListener;->processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    return-void

    .line 287
    :cond_1
    iput-boolean v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->parsingHex:Z

    return-void

    .line 281
    :cond_2
    invoke-direct {p0, p2}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleBinaryData(I)V

    :cond_3
    return-void
.end method

.method private handleGroupEnd()V
    .locals 1

    .line 339
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCharacterData()V

    .line 340
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {v0}, Lcom/rtfparserkit/parser/IRtfListener;->processGroupEnd()V

    .line 341
    iget v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    return-void
.end method

.method private handleGroupStart()V
    .locals 1

    .line 329
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCharacterData()V

    .line 330
    iget v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    .line 331
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    invoke-interface {v0}, Lcom/rtfparserkit/parser/IRtfListener;->processGroupStart()V

    return-void
.end method


# virtual methods
.method public parse(Lcom/rtfparserkit/parser/IRtfSource;Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->source:Lcom/rtfparserkit/parser/IRtfSource;

    .line 47
    iput-object p2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->listener:Lcom/rtfparserkit/parser/IRtfListener;

    const/4 v0, 0x0

    .line 48
    iput v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    .line 49
    iput-boolean v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->parsingHex:Z

    .line 50
    new-instance v1, Lcom/rtfparserkit/parser/raw/ByteBuffer;

    invoke-direct {v1}, Lcom/rtfparserkit/parser/raw/ByteBuffer;-><init>()V

    iput-object v1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->buffer:Lcom/rtfparserkit/parser/raw/ByteBuffer;

    .line 52
    invoke-interface {p2}, Lcom/rtfparserkit/parser/IRtfListener;->processDocumentStart()V

    .line 55
    iput-boolean v0, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->parsingHex:Z

    .line 60
    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/rtfparserkit/parser/IRtfSource;->read()I

    move-result v1

    const/4 v2, -0x1

    .line 61
    const-string v3, "Group stack underflow"

    if-ne v1, v2, :cond_3

    .line 112
    iget p1, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    if-ltz p1, :cond_2

    if-gtz p1, :cond_1

    .line 122
    invoke-interface {p2}, Lcom/rtfparserkit/parser/IRtfListener;->processDocumentEnd()V

    return-void

    .line 119
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unmatched brace"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 114
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :cond_3
    iget v2, p0, Lcom/rtfparserkit/parser/raw/RawRtfParser;->groupDepth:I

    if-ltz v2, :cond_8

    const/16 v2, 0x9

    if-eq v1, v2, :cond_7

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    const/16 v2, 0xd

    if-eq v1, v2, :cond_0

    const/16 v2, 0x5c

    if-eq v1, v2, :cond_6

    const/16 v2, 0x7b

    if-eq v1, v2, :cond_5

    const/16 v2, 0x7d

    if-eq v1, v2, :cond_4

    .line 106
    invoke-direct {p0, v1}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCharacterByte(I)V

    goto :goto_0

    .line 81
    :cond_4
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleGroupEnd()V

    goto :goto_0

    .line 75
    :cond_5
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleGroupStart()V

    goto :goto_0

    .line 87
    :cond_6
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCommand()V

    goto :goto_0

    .line 99
    :cond_7
    invoke-direct {p0}, Lcom/rtfparserkit/parser/raw/RawRtfParser;->handleCharacterData()V

    .line 100
    sget-object v1, Lcom/rtfparserkit/rtf/Command;->tab:Lcom/rtfparserkit/rtf/Command;

    invoke-interface {p2, v1, v0, v0, v0}, Lcom/rtfparserkit/parser/IRtfListener;->processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    goto :goto_0

    .line 68
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
