.class public Lorg/apache/commons/net/io/CopyStreamException;
.super Ljava/io/IOException;
.source "CopyStreamException.java"


# static fields
.field private static final serialVersionUID:J = -0x241f5af7ac0a699cL


# instance fields
.field private final totalBytesTransferred:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/io/IOException;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p0, p4}, Lorg/apache/commons/net/io/CopyStreamException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 48
    iput-wide p2, p0, Lorg/apache/commons/net/io/CopyStreamException;->totalBytesTransferred:J

    return-void
.end method


# virtual methods
.method public getIOException()Ljava/io/IOException;
    .locals 1

    .line 68
    invoke-virtual {p0}, Lorg/apache/commons/net/io/CopyStreamException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/io/IOException;

    return-object v0
.end method

.method public getTotalBytesTransferred()J
    .locals 2

    .line 59
    iget-wide v0, p0, Lorg/apache/commons/net/io/CopyStreamException;->totalBytesTransferred:J

    return-wide v0
.end method
