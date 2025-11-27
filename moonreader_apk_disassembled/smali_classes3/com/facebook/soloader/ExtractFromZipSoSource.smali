.class public Lcom/facebook/soloader/ExtractFromZipSoSource;
.super Lcom/facebook/soloader/UnpackingSoSource;
.source "ExtractFromZipSoSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/soloader/ExtractFromZipSoSource$ZipDso;,
        Lcom/facebook/soloader/ExtractFromZipSoSource$ZipUnpacker;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "soloader.ExtractFromZipSoSource"


# instance fields
.field protected final mZipFileName:Ljava/io/File;

.field protected final mZipSearchPattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/facebook/soloader/UnpackingSoSource;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 53
    iput-object p3, p0, Lcom/facebook/soloader/ExtractFromZipSoSource;->mZipFileName:Ljava/io/File;

    .line 54
    iput-object p4, p0, Lcom/facebook/soloader/ExtractFromZipSoSource;->mZipSearchPattern:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected computeFileHash(Ljava/io/File;)Ljava/lang/String;
    .locals 4

    .line 155
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :try_start_1
    new-instance p1, Ljava/util/zip/CRC32;

    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    const/16 v1, 0x400

    .line 157
    new-array v1, v1, [B

    .line 159
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    .line 160
    invoke-interface {p1, v1, v3, v2}, Ljava/util/zip/Checksum;->update([BII)V

    goto :goto_0

    .line 162
    :cond_0
    invoke-interface {p1}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object p1

    :catchall_0
    move-exception p1

    .line 155
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    .line 164
    const-string v0, "soloader.ExtractFromZipSoSource"

    const-string v1, "Failed to compute file hash "

    invoke-static {v0, v1, p1}, Lcom/facebook/soloader/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    const-string p1, ""

    return-object p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 59
    const-string v0, "ExtractFromZipSoSource"

    return-object v0
.end method

.method protected makeUnpacker(Z)Lcom/facebook/soloader/UnpackingSoSource$Unpacker;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    new-instance p1, Lcom/facebook/soloader/ExtractFromZipSoSource$ZipUnpacker;

    invoke-direct {p1, p0, p0}, Lcom/facebook/soloader/ExtractFromZipSoSource$ZipUnpacker;-><init>(Lcom/facebook/soloader/ExtractFromZipSoSource;Lcom/facebook/soloader/UnpackingSoSource;)V

    return-object p1
.end method
