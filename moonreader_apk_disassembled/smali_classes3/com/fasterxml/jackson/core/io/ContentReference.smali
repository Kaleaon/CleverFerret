.class public Lcom/fasterxml/jackson/core/io/ContentReference;
.super Ljava/lang/Object;
.source "ContentReference.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DEFAULT_MAX_CONTENT_SNIPPET:I = 0x1f4

.field protected static final UNKNOWN_CONTENT:Lcom/fasterxml/jackson/core/io/ContentReference;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final _isContentTextual:Z

.field protected final _length:I

.field protected final _offset:I

.field protected final transient _rawContent:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 35
    new-instance v0, Lcom/fasterxml/jackson/core/io/ContentReference;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/fasterxml/jackson/core/io/ContentReference;-><init>(ZLjava/lang/Object;)V

    sput-object v0, Lcom/fasterxml/jackson/core/io/ContentReference;->UNKNOWN_CONTENT:Lcom/fasterxml/jackson/core/io/ContentReference;

    return-void
.end method

.method protected constructor <init>(ZLjava/lang/Object;)V
    .locals 1

    const/4 v0, -0x1

    .line 80
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;-><init>(ZLjava/lang/Object;II)V

    return-void
.end method

.method protected constructor <init>(ZLjava/lang/Object;II)V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-boolean p1, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_isContentTextual:Z

    .line 87
    iput-object p2, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_rawContent:Ljava/lang/Object;

    .line 88
    iput p3, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_offset:I

    .line 89
    iput p4, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_length:I

    return-void
.end method

.method public static construct(ZLjava/lang/Object;)Lcom/fasterxml/jackson/core/io/ContentReference;
    .locals 1

    .line 104
    new-instance v0, Lcom/fasterxml/jackson/core/io/ContentReference;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/core/io/ContentReference;-><init>(ZLjava/lang/Object;)V

    return-object v0
.end method

.method public static construct(ZLjava/lang/Object;II)Lcom/fasterxml/jackson/core/io/ContentReference;
    .locals 1

    .line 109
    new-instance v0, Lcom/fasterxml/jackson/core/io/ContentReference;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/io/ContentReference;-><init>(ZLjava/lang/Object;II)V

    return-object v0
.end method

.method public static rawReference(Ljava/lang/Object;)Lcom/fasterxml/jackson/core/io/ContentReference;
    .locals 1

    const/4 v0, 0x0

    .line 135
    invoke-static {v0, p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->rawReference(ZLjava/lang/Object;)Lcom/fasterxml/jackson/core/io/ContentReference;

    move-result-object p0

    return-object p0
.end method

.method public static rawReference(ZLjava/lang/Object;)Lcom/fasterxml/jackson/core/io/ContentReference;
    .locals 1

    .line 128
    instance-of v0, p1, Lcom/fasterxml/jackson/core/io/ContentReference;

    if-eqz v0, :cond_0

    .line 129
    check-cast p1, Lcom/fasterxml/jackson/core/io/ContentReference;

    return-object p1

    .line 131
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/io/ContentReference;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/core/io/ContentReference;-><init>(ZLjava/lang/Object;)V

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public static unknown()Lcom/fasterxml/jackson/core/io/ContentReference;
    .locals 1

    .line 100
    sget-object v0, Lcom/fasterxml/jackson/core/io/ContentReference;->UNKNOWN_CONTENT:Lcom/fasterxml/jackson/core/io/ContentReference;

    return-object v0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method


# virtual methods
.method protected _append(Ljava/lang/StringBuilder;Ljava/lang/String;)I
    .locals 5

    const/16 v0, 0x22

    .line 317
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 319
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 323
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 324
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/core/io/ContentReference;->_appendEscaped(Ljava/lang/StringBuilder;I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 325
    :cond_0
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 328
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 329
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    return p1
.end method

.method protected _appendEscaped(Ljava/lang/StringBuilder;I)Z
    .locals 1

    const/16 v0, 0xd

    if-eq p2, v0, :cond_1

    const/16 v0, 0xa

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x5c

    .line 337
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v0, 0x75

    .line 338
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    shr-int/lit8 v0, p2, 0xc

    and-int/lit8 v0, v0, 0xf

    .line 339
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->hexToChar(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    shr-int/lit8 v0, p2, 0x8

    and-int/lit8 v0, v0, 0xf

    .line 340
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->hexToChar(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    shr-int/lit8 v0, p2, 0x4

    and-int/lit8 v0, v0, 0xf

    .line 341
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->hexToChar(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 p2, p2, 0xf

    .line 342
    invoke-static {p2}, Lcom/fasterxml/jackson/core/io/CharTypes;->hexToChar(I)C

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method protected _truncate(Ljava/lang/CharSequence;[II)Ljava/lang/String;
    .locals 2

    .line 276
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncateOffsets([II)V

    const/4 v0, 0x0

    .line 277
    aget v0, p2, v0

    const/4 v1, 0x1

    .line 278
    aget p2, p2, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    add-int/2addr p2, v0

    .line 279
    invoke-interface {p1, v0, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected _truncate([B[II)Ljava/lang/String;
    .locals 2

    .line 290
    array-length v0, p1

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncateOffsets([II)V

    const/4 v0, 0x0

    .line 291
    aget v0, p2, v0

    const/4 v1, 0x1

    .line 292
    aget p2, p2, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 293
    new-instance p3, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p3, p1, v0, p2, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object p3
.end method

.method protected _truncate([C[II)Ljava/lang/String;
    .locals 2

    .line 283
    array-length v0, p1

    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncateOffsets([II)V

    const/4 v0, 0x0

    .line 284
    aget v0, p2, v0

    const/4 v1, 0x1

    .line 285
    aget p2, p2, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 286
    new-instance p3, Ljava/lang/String;

    invoke-direct {p3, p1, v0, p2}, Ljava/lang/String;-><init>([CII)V

    return-object p3
.end method

.method protected _truncateOffsets([II)V
    .locals 3

    const/4 v0, 0x0

    .line 299
    aget v1, p1, v0

    if-gez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    if-lt v1, p2, :cond_1

    move v1, p2

    .line 306
    :cond_1
    :goto_0
    aput v1, p1, v0

    const/4 v0, 0x1

    .line 309
    aget v2, p1, v0

    sub-int/2addr p2, v1

    if-ltz v2, :cond_3

    if-le v2, p2, :cond_2

    goto :goto_1

    :cond_2
    return-void

    .line 312
    :cond_3
    :goto_1
    aput p2, p1, v0

    return-void
.end method

.method public appendSourceDescription(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 5

    .line 213
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->getRawContent()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 216
    const-string v0, "UNKNOWN"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object p1

    .line 220
    :cond_0
    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Ljava/lang/Class;

    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 222
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 224
    const-string v3, "java."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 225
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 226
    :cond_2
    instance-of v1, v0, [B

    if-eqz v1, :cond_3

    .line 227
    const-string v2, "byte[]"

    goto :goto_1

    .line 228
    :cond_3
    instance-of v1, v0, [C

    if-eqz v1, :cond_4

    .line 229
    const-string v2, "char[]"

    :cond_4
    :goto_1
    const/16 v1, 0x28

    .line 231
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 235
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->hasTextualContent()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 240
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->maxContentSnippetLength()I

    move-result v1

    .line 241
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->contentOffset()I

    move-result v2

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->contentLength()I

    move-result v3

    filled-new-array {v2, v3}, [I

    move-result-object v2

    .line 243
    instance-of v3, v0, Ljava/lang/CharSequence;

    const-string v4, " chars"

    if-eqz v3, :cond_5

    .line 244
    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncate(Ljava/lang/CharSequence;[II)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 245
    :cond_5
    instance-of v3, v0, [C

    if-eqz v3, :cond_6

    .line 246
    check-cast v0, [C

    check-cast v0, [C

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncate([C[II)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 247
    :cond_6
    instance-of v3, v0, [B

    if-eqz v3, :cond_7

    .line 248
    check-cast v0, [B

    check-cast v0, [B

    invoke-virtual {p0, v0, v2, v1}, Lcom/fasterxml/jackson/core/io/ContentReference;->_truncate([B[II)Ljava/lang/String;

    move-result-object v0

    .line 249
    const-string v4, " bytes"

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    :goto_2
    if-eqz v0, :cond_a

    .line 254
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;->_append(Ljava/lang/StringBuilder;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 255
    aget v3, v2, v0

    if-le v3, v1, :cond_a

    .line 256
    const-string v3, "[truncated "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v2, v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x5d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-object p1

    .line 261
    :cond_8
    instance-of v1, v0, [B

    if-eqz v1, :cond_a

    .line 262
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/io/ContentReference;->contentLength()I

    move-result v1

    if-gez v1, :cond_9

    .line 265
    check-cast v0, [B

    check-cast v0, [B

    array-length v1, v0

    :cond_9
    const/16 v0, 0x5b

    .line 267
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 268
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " bytes]"

    .line 269
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a
    return-object p1
.end method

.method public buildSourceDescription()Ljava/lang/String;
    .locals 2

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/io/ContentReference;->appendSourceDescription(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contentLength()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_length:I

    return v0
.end method

.method public contentOffset()I
    .locals 1

    .line 173
    iget v0, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_offset:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 360
    :cond_1
    instance-of v2, p1, Lcom/fasterxml/jackson/core/io/ContentReference;

    if-nez v2, :cond_2

    return v1

    .line 361
    :cond_2
    check-cast p1, Lcom/fasterxml/jackson/core/io/ContentReference;

    .line 364
    iget v2, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_offset:I

    iget v3, p1, Lcom/fasterxml/jackson/core/io/ContentReference;->_offset:I

    if-ne v2, v3, :cond_a

    iget v2, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_length:I

    iget v3, p1, Lcom/fasterxml/jackson/core/io/ContentReference;->_length:I

    if-eq v2, v3, :cond_3

    goto :goto_1

    .line 372
    :cond_3
    iget-object p1, p1, Lcom/fasterxml/jackson/core/io/ContentReference;->_rawContent:Ljava/lang/Object;

    .line 374
    iget-object v2, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_rawContent:Ljava/lang/Object;

    if-nez v2, :cond_5

    if-nez p1, :cond_4

    return v0

    :cond_4
    return v1

    :cond_5
    if-nez p1, :cond_6

    return v1

    .line 380
    :cond_6
    instance-of v3, v2, Ljava/io/File;

    if-nez v3, :cond_9

    instance-of v3, v2, Ljava/net/URL;

    if-nez v3, :cond_9

    instance-of v3, v2, Ljava/net/URI;

    if-eqz v3, :cond_7

    goto :goto_0

    :cond_7
    if-ne v2, p1, :cond_8

    return v0

    :cond_8
    return v1

    .line 384
    :cond_9
    :goto_0
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_a
    :goto_1
    return v1
.end method

.method public getRawContent()Ljava/lang/Object;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_rawContent:Ljava/lang/Object;

    return-object v0
.end method

.method public hasTextualContent()Z
    .locals 1

    .line 166
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_isContentTextual:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 392
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/ContentReference;->_rawContent:Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected maxContentSnippetLength()I
    .locals 1

    const/16 v0, 0x1f4

    return v0
.end method

.method protected readResolve()Ljava/lang/Object;
    .locals 1

    .line 156
    sget-object v0, Lcom/fasterxml/jackson/core/io/ContentReference;->UNKNOWN_CONTENT:Lcom/fasterxml/jackson/core/io/ContentReference;

    return-object v0
.end method
