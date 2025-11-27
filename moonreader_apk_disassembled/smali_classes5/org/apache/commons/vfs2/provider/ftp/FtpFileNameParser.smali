.class public Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;
.super Lorg/apache/commons/vfs2/provider/HostFileNameParser;
.source "FtpFileNameParser.java"


# static fields
.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;

.field private static final PORT:I = 0x15


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x15

    .line 31
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;-><init>(I)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 35
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;

    return-object v0
.end method
