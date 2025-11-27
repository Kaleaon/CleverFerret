.class public Lorg/apache/tools/zip/ZipEntry;
.super Ljava/util/zip/ZipEntry;
.source "ZipEntry.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final PLATFORM_FAT:I = 0x0

.field private static final PLATFORM_UNIX:I = 0x3

.field static synthetic class$java$util$zip$ZipEntry:Ljava/lang/Class; = null

.field private static lockReflection:Ljava/lang/Object; = null

.field private static setCompressedSizeMethod:Ljava/lang/reflect/Method; = null

.field private static triedToGetMethod:Z = false


# instance fields
.field private compressedSize:Ljava/lang/Long;

.field private externalAttributes:J

.field private extraFields:Ljava/util/Vector;

.field private internalAttributes:I

.field private name:Ljava/lang/String;

.field private platform:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 438
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/apache/tools/zip/ZipEntry;->lockReflection:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .line 143
    const-string v0, ""

    invoke-direct {p0, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 75
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    const-wide/16 v0, 0x0

    .line 76
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 77
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 378
    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->compressedSize:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 86
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 74
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 75
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    const-wide/16 v0, 0x0

    .line 76
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 77
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 378
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->compressedSize:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/util/zip/ZipEntry;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 99
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    .line 75
    iput v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    const-wide/16 v0, 0x0

    .line 76
    iput-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    .line 77
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    const/4 v2, 0x0

    .line 78
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    .line 378
    iput-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->compressedSize:Ljava/lang/Long;

    .line 101
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 103
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 105
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    .line 107
    invoke-virtual {p0, v2, v3}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 109
    :cond_0
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_1

    .line 111
    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setComprSize(J)V

    .line 113
    :cond_1
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_2

    .line 115
    invoke-virtual {p0, v2, v3}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 118
    :cond_2
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getExtra()[B

    move-result-object p1

    if-eqz p1, :cond_3

    .line 120
    invoke-static {p1}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([B)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    return-void

    .line 123
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/zip/ZipEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .line 133
    invoke-direct {p0, p1}, Lorg/apache/tools/zip/ZipEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 134
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 135
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 136
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    return-void
.end method

.method private static checkSCS()V
    .locals 6

    .line 483
    sget-boolean v0, Lorg/apache/tools/zip/ZipEntry;->triedToGetMethod:Z

    if-nez v0, :cond_1

    .line 484
    sget-object v0, Lorg/apache/tools/zip/ZipEntry;->lockReflection:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 485
    :try_start_0
    sput-boolean v1, Lorg/apache/tools/zip/ZipEntry;->triedToGetMethod:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 487
    :try_start_1
    sget-object v2, Lorg/apache/tools/zip/ZipEntry;->class$java$util$zip$ZipEntry:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string v2, "java.util.zip.ZipEntry"

    invoke-static {v2}, Lorg/apache/tools/zip/ZipEntry;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/zip/ZipEntry;->class$java$util$zip$ZipEntry:Ljava/lang/Class;

    :cond_0
    const-string v3, "setCompressedSize"

    new-array v1, v1, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v1, v5

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/zip/ZipEntry;->setCompressedSizeMethod:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 492
    :catch_0
    :try_start_2
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 488
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static haveSetCompressedSize()Z
    .locals 1

    .line 452
    invoke-static {}, Lorg/apache/tools/zip/ZipEntry;->checkSCS()V

    .line 453
    sget-object v0, Lorg/apache/tools/zip/ZipEntry;->setCompressedSizeMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static performSetCompressedSize(Lorg/apache/tools/zip/ZipEntry;J)V
    .locals 3

    .line 462
    const-string v0, ": "

    const-string v1, "Exception setting the compressed size of "

    new-instance v2, Ljava/lang/Long;

    invoke-direct {v2, p1, p2}, Ljava/lang/Long;-><init>(J)V

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Long;

    const/4 p2, 0x0

    aput-object v2, p1, p2

    .line 464
    :try_start_0
    sget-object p2, Lorg/apache/tools/zip/ZipEntry;->setCompressedSizeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {p2, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 471
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2

    :catch_0
    move-exception p1

    .line 466
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object p1

    .line 467
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public addExtraField(Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 4

    .line 296
    invoke-interface {p1}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-nez v1, :cond_2

    .line 298
    iget-object v3, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt v2, v3, :cond_0

    goto :goto_1

    .line 299
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/zip/ZipExtraField;

    invoke-interface {v3}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/apache/tools/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 300
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v1, p1, v2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    const/4 v1, 0x1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-nez v1, :cond_3

    .line 305
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 307
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 6

    .line 153
    :try_start_0
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/zip/ZipEntry;

    .line 155
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setName(Ljava/lang/String;)V

    .line 156
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 157
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 158
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 159
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 161
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 163
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v1

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    .line 165
    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/zip/ZipEntry;->setComprSize(J)V

    .line 167
    :cond_1
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v1

    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    .line 169
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 172
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Vector;

    iput-object v1, v0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    .line 173
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getInternalAttributes()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setInternalAttributes(I)V

    .line 174
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCentralDirectoryExtra()[B
    .locals 1

    .line 370
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->mergeCentralDirectoryData([Lorg/apache/tools/zip/ZipExtraField;)[B

    move-result-object v0

    return-object v0
.end method

.method public getCompressedSize()J
    .locals 2

    .line 402
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->compressedSize:Ljava/lang/Long;

    if-eqz v0, :cond_0

    .line 404
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 406
    :cond_0
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getExternalAttributes()J
    .locals 2

    .line 209
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    return-wide v0
.end method

.method public getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;
    .locals 2

    .line 284
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    new-array v0, v0, [Lorg/apache/tools/zip/ZipExtraField;

    .line 285
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    return-object v0
.end method

.method public getInternalAttributes()I
    .locals 1

    .line 191
    iget v0, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    return v0
.end method

.method public getLocalFileDataExtra()[B
    .locals 1

    .line 360
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getExtra()[B

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    .line 361
    new-array v0, v0, [B

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 413
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getPlatform()I
    .locals 1

    .line 255
    iget v0, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    return v0
.end method

.method public getUnixMode()I
    .locals 4

    .line 242
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExternalAttributes()J

    move-result-wide v0

    const/16 v2, 0x10

    shr-long/2addr v0, v2

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public isDirectory()Z
    .locals 2

    .line 420
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeExtraField(Lorg/apache/tools/zip/ZipShort;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-nez v0, :cond_2

    .line 317
    iget-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    goto :goto_1

    .line 318
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/zip/ZipExtraField;

    invoke-interface {v2}, Lorg/apache/tools/zip/ZipExtraField;->getHeaderId()Lorg/apache/tools/zip/ZipShort;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/tools/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 319
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->removeElementAt(I)V

    const/4 v0, 0x1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 326
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    return-void

    .line 324
    :cond_3
    new-instance p1, Ljava/util/NoSuchElementException;

    invoke-direct {p1}, Ljava/util/NoSuchElementException;-><init>()V

    throw p1
.end method

.method public setComprSize(J)V
    .locals 1

    .line 389
    invoke-static {}, Lorg/apache/tools/zip/ZipEntry;->haveSetCompressedSize()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    invoke-static {p0, p1, p2}, Lorg/apache/tools/zip/ZipEntry;->performSetCompressedSize(Lorg/apache/tools/zip/ZipEntry;J)V

    return-void

    .line 392
    :cond_0
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->compressedSize:Ljava/lang/Long;

    return-void
.end method

.method public setExternalAttributes(J)V
    .locals 0

    .line 218
    iput-wide p1, p0, Lorg/apache/tools/zip/ZipEntry;->externalAttributes:J

    return-void
.end method

.method protected setExtra()V
    .locals 1

    .line 351
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/zip/ExtraFieldUtils;->mergeLocalFileDataData([Lorg/apache/tools/zip/ZipExtraField;)[B

    move-result-object v0

    invoke-super {p0, v0}, Ljava/util/zip/ZipEntry;->setExtra([B)V

    return-void
.end method

.method public setExtra([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 336
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/zip/ExtraFieldUtils;->parse([B)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 338
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 3

    .line 271
    iget-object v0, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    const/4 v0, 0x0

    .line 272
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_0

    .line 275
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->setExtra()V

    return-void

    .line 273
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipEntry;->extraFields:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setInternalAttributes(I)V
    .locals 0

    .line 200
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->internalAttributes:I

    return-void
.end method

.method protected setName(Ljava/lang/String;)V
    .locals 0

    .line 424
    iput-object p1, p0, Lorg/apache/tools/zip/ZipEntry;->name:Ljava/lang/String;

    return-void
.end method

.method protected setPlatform(I)V
    .locals 0

    .line 262
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    return-void
.end method

.method public setUnixMode(I)V
    .locals 2

    shl-int/lit8 v0, p1, 0x10

    and-int/lit16 p1, p1, 0x80

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    or-int/2addr p1, v0

    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v1, 0x10

    :cond_1
    or-int/2addr p1, v1

    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setExternalAttributes(J)V

    const/4 p1, 0x3

    .line 233
    iput p1, p0, Lorg/apache/tools/zip/ZipEntry;->platform:I

    return-void
.end method
