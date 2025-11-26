.class public Lcom/dropbox/core/util/IOUtil;
.super Ljava/lang/Object;
.source "IOUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/util/IOUtil$ProgressListener;,
        Lcom/dropbox/core/util/IOUtil$LimitInputStream;,
        Lcom/dropbox/core/util/IOUtil$WriteException;,
        Lcom/dropbox/core/util/IOUtil$ReadException;,
        Lcom/dropbox/core/util/IOUtil$WrappedException;
    }
.end annotation


# static fields
.field public static final BlackHoleOutputStream:Ljava/io/OutputStream;

.field public static final DEFAULT_COPY_BUFFER_SIZE:I = 0x4000

.field public static final EmptyInputStream:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 212
    new-instance v0, Lcom/dropbox/core/util/IOUtil$1;

    invoke-direct {v0}, Lcom/dropbox/core/util/IOUtil$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/util/IOUtil;->EmptyInputStream:Ljava/io/InputStream;

    .line 218
    new-instance v0, Lcom/dropbox/core/util/IOUtil$2;

    invoke-direct {v0}, Lcom/dropbox/core/util/IOUtil$2;-><init>()V

    sput-object v0, Lcom/dropbox/core/util/IOUtil;->BlackHoleOutputStream:Ljava/io/OutputStream;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeInput(Ljava/io/InputStream;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 130
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static closeInput(Ljava/io/Reader;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 143
    :try_start_0
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 153
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    const/16 v0, 0x4000

    .line 43
    invoke-static {p0, p1, v0}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)V

    return-void
.end method

.method public static copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    .line 68
    new-array p2, p2, [B

    invoke-static {p0, p1, p2}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V

    return-void
.end method

.method public static copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    .line 51
    :goto_0
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 59
    :try_start_1
    invoke-virtual {p1, p2, v1, v0}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 61
    new-instance p1, Lcom/dropbox/core/util/IOUtil$WriteException;

    invoke-direct {p1, p0}, Lcom/dropbox/core/util/IOUtil$WriteException;-><init>(Ljava/io/IOException;)V

    throw p1

    :catch_1
    move-exception p0

    .line 53
    new-instance p1, Lcom/dropbox/core/util/IOUtil$ReadException;

    invoke-direct {p1, p0}, Lcom/dropbox/core/util/IOUtil$ReadException;-><init>(Ljava/io/IOException;)V

    throw p1
.end method

.method public static limit(Ljava/io/InputStream;J)Ljava/io/InputStream;
    .locals 1

    .line 161
    new-instance v0, Lcom/dropbox/core/util/IOUtil$LimitInputStream;

    invoke-direct {v0, p0, p1, p2}, Lcom/dropbox/core/util/IOUtil$LimitInputStream;-><init>(Ljava/io/InputStream;J)V

    return-object v0
.end method

.method public static slurp(Ljava/io/InputStream;I)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x4000

    .line 72
    new-array v0, v0, [B

    invoke-static {p0, p1, v0}, Lcom/dropbox/core/util/IOUtil;->slurp(Ljava/io/InputStream;I[B)[B

    move-result-object p0

    return-object p0
.end method

.method public static slurp(Ljava/io/InputStream;I[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_0

    .line 78
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 79
    invoke-static {p0, p1, p2}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V

    .line 80
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 76
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "\'byteLimit\' must be non-negative: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static toUtf8String(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Ljava/nio/charset/CharacterCodingException;
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 35
    :try_start_0
    invoke-static {p0, v0}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Lcom/dropbox/core/util/IOUtil$WriteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    invoke-static {p0}, Lcom/dropbox/core/util/StringUtil;->utf8ToString([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception p0

    .line 37
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "impossible"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static utf8Reader(Ljava/io/InputStream;)Ljava/io/Reader;
    .locals 2

    .line 25
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lcom/dropbox/core/util/StringUtil;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/CharsetDecoder;)V

    return-object v0
.end method

.method public static utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;
    .locals 2

    .line 29
    new-instance v0, Ljava/io/OutputStreamWriter;

    sget-object v1, Lcom/dropbox/core/util/StringUtil;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/CharsetEncoder;)V

    return-object v0
.end method


# virtual methods
.method public copyFileToStream(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    const/16 v0, 0x4000

    .line 84
    invoke-virtual {p0, p1, p2, v0}, Lcom/dropbox/core/util/IOUtil;->copyFileToStream(Ljava/io/File;Ljava/io/OutputStream;I)V

    return-void
.end method

.method public copyFileToStream(Ljava/io/File;Ljava/io/OutputStream;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    .line 90
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :try_start_1
    invoke-static {v0, p2, p3}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    invoke-static {v0}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {v0}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    .line 99
    throw p1

    :catch_0
    move-exception p1

    .line 92
    new-instance p2, Lcom/dropbox/core/util/IOUtil$ReadException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/util/IOUtil$ReadException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public copyStreamToFile(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    const/16 v0, 0x4000

    .line 103
    invoke-virtual {p0, p1, p2, v0}, Lcom/dropbox/core/util/IOUtil;->copyStreamToFile(Ljava/io/InputStream;Ljava/io/File;I)V

    return-void
.end method

.method public copyStreamToFile(Ljava/io/InputStream;Ljava/io/File;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/util/IOUtil$ReadException;,
            Lcom/dropbox/core/util/IOUtil$WriteException;
        }
    .end annotation

    .line 109
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 115
    :try_start_1
    invoke-static {p1, v0, p3}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 119
    new-instance p2, Lcom/dropbox/core/util/IOUtil$WriteException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/util/IOUtil$WriteException;-><init>(Ljava/io/IOException;)V

    throw p2

    :catchall_0
    move-exception p1

    .line 117
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 121
    throw p1

    :catch_1
    move-exception p1

    .line 119
    new-instance p2, Lcom/dropbox/core/util/IOUtil$WriteException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/util/IOUtil$WriteException;-><init>(Ljava/io/IOException;)V

    throw p2

    :catch_2
    move-exception p1

    .line 111
    new-instance p2, Lcom/dropbox/core/util/IOUtil$WriteException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/util/IOUtil$WriteException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method
