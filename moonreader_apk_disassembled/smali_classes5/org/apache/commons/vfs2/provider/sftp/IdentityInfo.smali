.class public Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;
.super Ljava/lang/Object;
.source "IdentityInfo.java"


# instance fields
.field private final passPhrase:[B

.field private final privateKey:Ljava/io/File;

.field private final publicKey:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;-><init>(Ljava/io/File;Ljava/io/File;[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/File;[B)V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->privateKey:Ljava/io/File;

    .line 70
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->publicKey:Ljava/io/File;

    .line 71
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->passPhrase:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/File;[B)V
    .locals 1

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;-><init>(Ljava/io/File;Ljava/io/File;[B)V

    return-void
.end method


# virtual methods
.method public getPassPhrase()[B
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->passPhrase:[B

    return-object v0
.end method

.method public getPrivateKey()Ljava/io/File;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->privateKey:Ljava/io/File;

    return-object v0
.end method

.method public getPublicKey()Ljava/io/File;
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/sftp/IdentityInfo;->publicKey:Ljava/io/File;

    return-object v0
.end method
