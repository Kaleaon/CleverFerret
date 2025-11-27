.class public Lorg/apache/commons/net/ftp/FTPFile;
.super Ljava/lang/Object;
.source "FTPFile.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DIRECTORY_TYPE:I = 0x1

.field public static final EXECUTE_PERMISSION:I = 0x2

.field public static final FILE_TYPE:I = 0x0

.field public static final GROUP_ACCESS:I = 0x1

.field public static final READ_PERMISSION:I = 0x0

.field public static final SYMBOLIC_LINK_TYPE:I = 0x2

.field public static final UNKNOWN_TYPE:I = 0x3

.field public static final USER_ACCESS:I = 0x0

.field public static final WORLD_ACCESS:I = 0x2

.field public static final WRITE_PERMISSION:I = 0x1

.field private static final serialVersionUID:J = 0x7d0cc2180c52bb3cL


# instance fields
.field private date:Ljava/util/Calendar;

.field private group:Ljava/lang/String;

.field private hardLinkCount:I

.field private link:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private final permissions:[[Z

.field private rawListing:Ljava/lang/String;

.field private size:J

.field private type:I

.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 67
    iput v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    const-wide/16 v1, -0x1

    .line 73
    iput-wide v1, p0, Lorg/apache/commons/net/ftp/FTPFile;->size:J

    .line 75
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPFile;->user:Ljava/lang/String;

    .line 76
    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPFile;->group:Ljava/lang/String;

    const/4 v1, 0x2

    .line 86
    new-array v1, v1, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v2, 0x0

    aput v0, v1, v2

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->permissions:[[Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 67
    iput v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    const-wide/16 v0, -0x1

    .line 73
    iput-wide v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->size:J

    .line 75
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->user:Ljava/lang/String;

    .line 76
    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->group:Ljava/lang/String;

    const/4 v0, 0x0

    .line 96
    move-object v1, v0

    check-cast v1, [[Z

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->permissions:[[Z

    .line 97
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->rawListing:Ljava/lang/String;

    return-void
.end method

.method private formatType()C
    .locals 2

    .line 101
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/16 v0, 0x3f

    return v0

    :cond_0
    const/16 v0, 0x6c

    return v0

    :cond_1
    const/16 v0, 0x64

    return v0

    :cond_2
    const/16 v0, 0x2d

    return v0
.end method

.method private permissionToString(I)Ljava/lang/String;
    .locals 3

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 265
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/net/ftp/FTPFile;->hasPermission(II)Z

    move-result v1

    const/16 v2, 0x2d

    if-eqz v1, :cond_0

    const/16 v1, 0x72

    .line 266
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 268
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_0
    const/4 v1, 0x1

    .line 270
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/net/ftp/FTPFile;->hasPermission(II)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x77

    .line 271
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 273
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    const/4 v1, 0x2

    .line 275
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/net/ftp/FTPFile;->hasPermission(II)Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x78

    .line 276
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 278
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 280
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getGroup()Ljava/lang/String;
    .locals 1

    .line 120
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getHardLinkCount()I
    .locals 1

    .line 129
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->hardLinkCount:I

    return v0
.end method

.method public getLink()Ljava/lang/String;
    .locals 1

    .line 139
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->link:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 148
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRawListing()Ljava/lang/String;
    .locals 1

    .line 157
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->rawListing:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 166
    iget-wide v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->size:J

    return-wide v0
.end method

.method public getTimestamp()Ljava/util/Calendar;
    .locals 1

    .line 175
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->date:Ljava/util/Calendar;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 185
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    return v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .line 194
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->user:Ljava/lang/String;

    return-object v0
.end method

.method public hasPermission(II)Z
    .locals 1

    .line 207
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->permissions:[[Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 210
    :cond_0
    aget-object p1, v0, p1

    aget-boolean p1, p1, p2

    return p1
.end method

.method public isDirectory()Z
    .locals 2

    .line 219
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFile()Z
    .locals 1

    .line 228
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSymbolicLink()Z
    .locals 2

    .line 237
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnknown()Z
    .locals 2

    .line 246
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isValid()Z
    .locals 1

    .line 260
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->permissions:[[Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 0

    .line 289
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->group:Ljava/lang/String;

    return-void
.end method

.method public setHardLinkCount(I)V
    .locals 0

    .line 298
    iput p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->hardLinkCount:I

    return-void
.end method

.method public setLink(Ljava/lang/String;)V
    .locals 0

    .line 308
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->link:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 317
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->name:Ljava/lang/String;

    return-void
.end method

.method public setPermission(IIZ)V
    .locals 1

    .line 330
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPFile;->permissions:[[Z

    aget-object p1, v0, p1

    aput-boolean p3, p1, p2

    return-void
.end method

.method public setRawListing(Ljava/lang/String;)V
    .locals 0

    .line 339
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->rawListing:Ljava/lang/String;

    return-void
.end method

.method public setSize(J)V
    .locals 0

    .line 348
    iput-wide p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->size:J

    return-void
.end method

.method public setTimestamp(Ljava/util/Calendar;)V
    .locals 0

    .line 358
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->date:Ljava/util/Calendar;

    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 367
    iput p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->type:I

    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 0

    .line 376
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPFile;->user:Ljava/lang/String;

    return-void
.end method

.method public toFormattedString()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 392
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPFile;->toFormattedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toFormattedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 410
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 411
    const-string p1, "[Invalid: could not parse file entry]"

    return-object p1

    .line 413
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 414
    new-instance v1, Ljava/util/Formatter;

    invoke-direct {v1, v0}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    .line 415
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPFile;->formatType()C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 416
    invoke-direct {p0, v2}, Lorg/apache/commons/net/ftp/FTPFile;->permissionToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    .line 417
    invoke-direct {p0, v3}, Lorg/apache/commons/net/ftp/FTPFile;->permissionToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x2

    .line 418
    invoke-direct {p0, v4}, Lorg/apache/commons/net/ftp/FTPFile;->permissionToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    const-string v5, " %4d"

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getHardLinkCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v6, v7, v2

    invoke-virtual {v1, v5, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 420
    const-string v5, " %-8s %-8s"

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getUser()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getGroup()Ljava/lang/String;

    move-result-object v7

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v6, v4, v2

    aput-object v7, v4, v3

    invoke-virtual {v1, v5, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 421
    const-string v4, " %8d"

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v5, v6, v2

    invoke-virtual {v1, v4, v6}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 422
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v4

    if-eqz v4, :cond_3

    if-eqz p1, :cond_1

    .line 425
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    .line 426
    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 427
    invoke-virtual {v4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    .line 428
    invoke-static {p1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object p1

    .line 429
    invoke-virtual {p1, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    move-object v4, p1

    .line 433
    :cond_1
    const-string p1, " %1$tY-%1$tm-%1$td"

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-virtual {v1, p1, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/16 p1, 0xb

    .line 435
    invoke-virtual {v4, p1}, Ljava/util/Calendar;->isSet(I)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 436
    const-string p1, " %1$tH"

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-virtual {v1, p1, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/16 p1, 0xc

    .line 437
    invoke-virtual {v4, p1}, Ljava/util/Calendar;->isSet(I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 438
    const-string p1, ":%1$tM"

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-virtual {v1, p1, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/16 p1, 0xd

    .line 439
    invoke-virtual {v4, p1}, Ljava/util/Calendar;->isSet(I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 440
    const-string p1, ":%1$tS"

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-virtual {v1, p1, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/16 p1, 0xe

    .line 441
    invoke-virtual {v4, p1}, Ljava/util/Calendar;->isSet(I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 442
    const-string p1, ".%1$tL"

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-virtual {v1, p1, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 446
    :cond_2
    const-string p1, " %1$tZ"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v4, v3, v2

    invoke-virtual {v1, p1, v3}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    :cond_3
    const/16 p1, 0x20

    .line 449
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 450
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 451
    invoke-virtual {v1}, Ljava/util/Formatter;->close()V

    .line 452
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 414
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    .line 451
    :try_start_2
    invoke-virtual {v1}, Ljava/util/Formatter;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v1

    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 462
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPFile;->getRawListing()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
