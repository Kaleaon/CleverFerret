.class public abstract Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.super Ljava/lang/Object;
.source "FileSystemConfigBuilder.java"


# static fields
.field private static final PREFIX:Ljava/lang/String; = "vfs."

.field private static final ROOTURI:Ljava/lang/String; = "rootURI"


# instance fields
.field private final prefix:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, "vfs."

    iput-object v0, p0, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->prefix:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "vfs."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->prefix:Ljava/lang/String;

    return-void
.end method

.method private getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 676
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->toPropertyKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private toPropertyKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 664
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    const/4 v0, 0x0

    .line 156
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 186
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-nez p1, :cond_1

    .line 188
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 192
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)Z
    .locals 0

    .line 171
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method protected getByte(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;B)B
    .locals 0

    .line 223
    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getByte(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Byte;)Ljava/lang/Byte;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result p1

    return p1
.end method

.method protected getByte(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Byte;
    .locals 1

    const/4 v0, 0x0

    .line 208
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getByte(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Byte;)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method protected getByte(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Byte;)Ljava/lang/Byte;
    .locals 0

    .line 237
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Byte;

    if-nez p1, :cond_1

    .line 239
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 243
    :cond_0
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected getCharacter(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;C)C
    .locals 1

    .line 274
    new-instance v0, Ljava/lang/Character;

    invoke-direct {v0, p3}, Ljava/lang/Character;-><init>(C)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getCharacter(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Character;)Ljava/lang/Character;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result p1

    return p1
.end method

.method protected getCharacter(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Character;
    .locals 1

    const/4 v0, 0x0

    .line 259
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getCharacter(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Character;)Ljava/lang/Character;

    move-result-object p1

    return-object p1
.end method

.method protected getCharacter(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Character;)Ljava/lang/Character;
    .locals 0

    .line 288
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Character;

    if-nez p1, :cond_2

    .line 290
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 291
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 294
    :cond_0
    new-instance p2, Ljava/lang/Character;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-direct {p2, p1}, Ljava/lang/Character;-><init>(C)V

    return-object p2

    :cond_1
    :goto_0
    return-object p3

    :cond_2
    return-object p1
.end method

.method protected abstract getConfigClass()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation
.end method

.method protected getDouble(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;D)D
    .locals 1

    .line 325
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p3, p4}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getDouble(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    return-wide p1
.end method

.method protected getDouble(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Double;
    .locals 1

    const/4 v0, 0x0

    .line 310
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getDouble(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method protected getDouble(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;
    .locals 0

    .line 339
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Double;

    if-nez p1, :cond_2

    .line 341
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 342
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 345
    :cond_0
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p3

    :cond_2
    return-object p1
.end method

.method protected getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Enum;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>(",
            "Ljava/lang/Class<",
            "TE;>;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            "Ljava/lang/String;",
            ")TE;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 364
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object p1

    return-object p1
.end method

.method protected getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>(",
            "Ljava/lang/Class<",
            "TE;>;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            "Ljava/lang/String;",
            "TE;)TE;"
        }
    .end annotation

    .line 384
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Enum;

    if-nez p2, :cond_1

    .line 386
    invoke-direct {p0, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_0

    return-object p4

    .line 390
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p2
.end method

.method protected getFloat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;F)F
    .locals 1

    .line 423
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p3}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getFloat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    return p1
.end method

.method protected getFloat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Float;
    .locals 1

    const/4 v0, 0x0

    .line 407
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getFloat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method

.method protected getFloat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 0

    .line 438
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    if-nez p1, :cond_2

    .line 440
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 441
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-gtz p2, :cond_0

    goto :goto_0

    .line 444
    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p3

    :cond_2
    return-object p1
.end method

.method protected getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I
    .locals 0

    .line 477
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method protected getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    const/4 v0, 0x0

    .line 461
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 492
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_1

    .line 494
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 498
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;J)J
    .locals 0

    .line 531
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    return-wide p1
.end method

.method protected getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Long;
    .locals 1

    const/4 v0, 0x0

    .line 515
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    .line 546
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    if-nez p1, :cond_1

    .line 548
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 552
    :cond_0
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 116
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getConfigClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemOptions;->getOption(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getRootURI(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 73
    const-string v0, "rootURI"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getShort(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Short;
    .locals 1

    const/4 v0, 0x0

    .line 569
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getShort(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Short;)Ljava/lang/Short;

    move-result-object p1

    return-object p1
.end method

.method protected getShort(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Short;)Ljava/lang/Short;
    .locals 0

    .line 600
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Short;

    if-nez p1, :cond_1

    .line 602
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 606
    :cond_0
    invoke-static {p1}, Ljava/lang/Short;->valueOf(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected getShort(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;S)S
    .locals 0

    .line 585
    invoke-static {p3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getShort(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Short;)Ljava/lang/Short;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result p1

    return p1
.end method

.method protected getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 622
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 636
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    .line 638
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    :cond_0
    return-object p1
.end method

.method protected hasObject(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Z
    .locals 0

    .line 142
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->hasParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object p1

    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->toPropertyKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method protected hasParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 129
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getConfigClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemOptions;->hasOption(Ljava/lang/Class;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 99
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->getConfigClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0, p2, p3}, Lorg/apache/commons/vfs2/FileSystemOptions;->setOption(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)V
    .locals 0

    .line 86
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setRootURI(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 61
    const-string v0, "rootURI"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
