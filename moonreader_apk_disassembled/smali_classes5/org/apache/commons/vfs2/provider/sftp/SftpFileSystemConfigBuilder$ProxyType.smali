.class public final Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;
.super Ljava/lang/Object;
.source "SftpFileSystemConfigBuilder.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProxyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x132b858L


# instance fields
.field private final proxyType:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$1;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 36
    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->compareTo(Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;)I
    .locals 1

    .line 50
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 62
    :cond_1
    check-cast p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;

    .line 64
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    if-eqz v2, :cond_2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_3

    :goto_0
    return v1

    :cond_3
    return v0

    :cond_4
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 77
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/SftpFileSystemConfigBuilder$ProxyType;->proxyType:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
