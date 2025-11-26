.class public final Lcom/dropbox/core/v1/DbxEntry$File;
.super Lcom/dropbox/core/v1/DbxEntry;
.source "DbxEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "File"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v1/DbxEntry$File$Location;,
        Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;,
        Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;
    }
.end annotation


# static fields
.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            ">;"
        }
    .end annotation
.end field

.field public static final ReaderMaybeDeleted:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            ">;"
        }
    .end annotation
.end field

.field public static final serialVersionUID:J


# instance fields
.field public final clientMtime:Ljava/util/Date;

.field public final humanSize:Ljava/lang/String;

.field public final lastModified:Ljava/util/Date;

.field public final numBytes:J

.field public final photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

.field public final rev:Ljava/lang/String;

.field public final videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 310
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$File$1;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxEntry$File$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxEntry$File;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 325
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$File$2;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxEntry$File$2;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxEntry$File;->ReaderMaybeDeleted:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZJLjava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide/from16 v4, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    .line 275
    invoke-direct/range {v0 .. v11}, Lcom/dropbox/core/v1/DbxEntry$File;-><init>(Ljava/lang/String;Ljava/lang/String;ZJLjava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZJLjava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;)V
    .locals 1

    const/4 v0, 0x0

    .line 259
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v1/DbxEntry;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v1/DbxEntry$1;)V

    .line 260
    iput-wide p4, p0, Lcom/dropbox/core/v1/DbxEntry$File;->numBytes:J

    .line 261
    iput-object p6, p0, Lcom/dropbox/core/v1/DbxEntry$File;->humanSize:Ljava/lang/String;

    .line 262
    iput-object p7, p0, Lcom/dropbox/core/v1/DbxEntry$File;->lastModified:Ljava/util/Date;

    .line 263
    iput-object p8, p0, Lcom/dropbox/core/v1/DbxEntry$File;->clientMtime:Ljava/util/Date;

    .line 264
    iput-object p9, p0, Lcom/dropbox/core/v1/DbxEntry$File;->rev:Ljava/lang/String;

    .line 265
    iput-object p10, p0, Lcom/dropbox/core/v1/DbxEntry$File;->photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    .line 266
    iput-object p11, p0, Lcom/dropbox/core/v1/DbxEntry$File;->videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    return-void
.end method

.method private static nullablePendingField(Lcom/dropbox/core/util/DumpWriter;Ljava/lang/String;Lcom/dropbox/core/util/Dumpable;Lcom/dropbox/core/util/Dumpable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/dropbox/core/util/Dumpable;",
            ">(",
            "Lcom/dropbox/core/util/DumpWriter;",
            "Ljava/lang/String;",
            "TT;TT;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    return-void

    .line 295
    :cond_0
    invoke-virtual {p0, p1}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    if-ne p2, p3, :cond_1

    .line 297
    const-string p1, "pending"

    invoke-virtual {p0, p1}, Lcom/dropbox/core/util/DumpWriter;->verbatim(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    return-void

    .line 299
    :cond_1
    invoke-virtual {p0, p2}, Lcom/dropbox/core/util/DumpWriter;->v(Lcom/dropbox/core/util/Dumpable;)Lcom/dropbox/core/util/DumpWriter;

    return-void
.end method


# virtual methods
.method public asFile()Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0

    return-object p0
.end method

.method public asFolder()Lcom/dropbox/core/v1/DbxEntry$Folder;
    .locals 2

    .line 307
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not a folder"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected dumpFields(Lcom/dropbox/core/util/DumpWriter;)V
    .locals 3

    .line 280
    invoke-super {p0, p1}, Lcom/dropbox/core/v1/DbxEntry;->dumpFields(Lcom/dropbox/core/util/DumpWriter;)V

    .line 281
    const-string v0, "numBytes"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-wide v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->numBytes:J

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/util/DumpWriter;->v(J)Lcom/dropbox/core/util/DumpWriter;

    .line 282
    const-string v0, "humanSize"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->humanSize:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    .line 283
    const-string v0, "lastModified"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->lastModified:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/util/Date;)Lcom/dropbox/core/util/DumpWriter;

    .line 284
    const-string v0, "clientMtime"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->clientMtime:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/util/Date;)Lcom/dropbox/core/util/DumpWriter;

    .line 285
    const-string v0, "rev"

    invoke-virtual {p1, v0}, Lcom/dropbox/core/util/DumpWriter;->f(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->rev:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/util/DumpWriter;->v(Ljava/lang/String;)Lcom/dropbox/core/util/DumpWriter;

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    sget-object v1, Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;->PENDING:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    const-string v2, "photoInfo"

    invoke-static {p1, v2, v0, v1}, Lcom/dropbox/core/v1/DbxEntry$File;->nullablePendingField(Lcom/dropbox/core/util/DumpWriter;Ljava/lang/String;Lcom/dropbox/core/util/Dumpable;Lcom/dropbox/core/util/Dumpable;)V

    .line 287
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    sget-object v1, Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;->PENDING:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    const-string v2, "videoInfo"

    invoke-static {p1, v2, v0, v1}, Lcom/dropbox/core/v1/DbxEntry$File;->nullablePendingField(Lcom/dropbox/core/util/DumpWriter;Ljava/lang/String;Lcom/dropbox/core/util/Dumpable;Lcom/dropbox/core/util/Dumpable;)V

    return-void
.end method

.method public equals(Lcom/dropbox/core/v1/DbxEntry$File;)Z
    .locals 6

    .line 349
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxEntry$File;->partialEquals(Lcom/dropbox/core/v1/DbxEntry;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 350
    :cond_0
    iget-wide v2, p0, Lcom/dropbox/core/v1/DbxEntry$File;->numBytes:J

    iget-wide v4, p1, Lcom/dropbox/core/v1/DbxEntry$File;->numBytes:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_1

    return v1

    .line 351
    :cond_1
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->humanSize:Ljava/lang/String;

    iget-object v2, p1, Lcom/dropbox/core/v1/DbxEntry$File;->humanSize:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    .line 352
    :cond_2
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->lastModified:Ljava/util/Date;

    iget-object v2, p1, Lcom/dropbox/core/v1/DbxEntry$File;->lastModified:Ljava/util/Date;

    invoke-virtual {v0, v2}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    .line 353
    :cond_3
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->clientMtime:Ljava/util/Date;

    iget-object v2, p1, Lcom/dropbox/core/v1/DbxEntry$File;->clientMtime:Ljava/util/Date;

    invoke-virtual {v0, v2}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    .line 354
    :cond_4
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->rev:Ljava/lang/String;

    iget-object v2, p1, Lcom/dropbox/core/v1/DbxEntry$File;->rev:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    .line 355
    :cond_5
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    iget-object v2, p1, Lcom/dropbox/core/v1/DbxEntry$File;->photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    invoke-static {v0, v2}, Lcom/dropbox/core/util/LangUtil;->nullableEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    .line 356
    :cond_6
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxEntry$File;->videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    iget-object p1, p1, Lcom/dropbox/core/v1/DbxEntry$File;->videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    invoke-static {v0, p1}, Lcom/dropbox/core/util/LangUtil;->nullableEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    return v1

    :cond_7
    const/4 p1, 0x1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 344
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$File;

    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxEntry$File;->equals(Lcom/dropbox/core/v1/DbxEntry$File;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected getTypeName()Ljava/lang/String;
    .locals 1

    .line 303
    const-string v0, "File"

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 363
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxEntry$File;->partialHashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 364
    iget-wide v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->numBytes:J

    long-to-int v2, v1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 365
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->lastModified:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 366
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->clientMtime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 367
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->rev:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 368
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->photoInfo:Lcom/dropbox/core/v1/DbxEntry$File$PhotoInfo;

    invoke-static {v1}, Lcom/dropbox/core/util/LangUtil;->nullableHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 369
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxEntry$File;->videoInfo:Lcom/dropbox/core/v1/DbxEntry$File$VideoInfo;

    invoke-static {v1}, Lcom/dropbox/core/util/LangUtil;->nullableHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isFile()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isFolder()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
