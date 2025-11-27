.class public Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;
.super Lorg/apache/commons/vfs2/provider/URLFileNameParser;
.source "SftpFileNameParser.java"


# static fields
.field private static final DEFAULT_PORT:I = 0x16

.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x16

    .line 34
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;-><init>(I)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 43
    sget-object v0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/sftp/SftpFileNameParser;

    return-object v0
.end method
