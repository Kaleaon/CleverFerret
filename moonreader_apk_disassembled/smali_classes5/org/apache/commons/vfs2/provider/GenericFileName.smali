.class public Lorg/apache/commons/vfs2/provider/GenericFileName;
.super Lorg/apache/commons/vfs2/provider/AbstractFileName;
.source "GenericFileName.java"


# static fields
.field private static final PASSWORD_RESERVED:[C

.field private static final USERNAME_RESERVED:[C


# instance fields
.field private final defaultPort:I

.field private final hostName:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final port:I

.field private final userName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x3

    .line 27
    new-array v1, v0, [C

    fill-array-data v1, :array_0

    sput-object v1, Lorg/apache/commons/vfs2/provider/GenericFileName;->USERNAME_RESERVED:[C

    .line 28
    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/commons/vfs2/provider/GenericFileName;->PASSWORD_RESERVED:[C

    return-void

    :array_0
    .array-data 2
        0x3as
        0x40s
        0x2fs
    .end array-data

    nop

    :array_1
    .array-data 2
        0x40s
        0x2fs
        0x3fs
    .end array-data
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p7, p8}, Lorg/apache/commons/vfs2/provider/AbstractFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 38
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->hostName:Ljava/lang/String;

    .line 39
    iput p4, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->defaultPort:I

    .line 40
    iput-object p6, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->password:Ljava/lang/String;

    .line 41
    iput-object p5, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->userName:Ljava/lang/String;

    if-lez p3, :cond_0

    .line 43
    iput p3, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getDefaultPort()I

    move-result p1

    iput p1, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    return-void
.end method


# virtual methods
.method protected appendCredentials(Ljava/lang/StringBuilder;Z)V
    .locals 2

    .line 130
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->userName:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 131
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->userName:Ljava/lang/String;

    sget-object v1, Lorg/apache/commons/vfs2/provider/GenericFileName;->USERNAME_RESERVED:[C

    invoke-static {p1, v0, v1}, Lorg/apache/commons/vfs2/provider/UriParser;->appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/String;[C)V

    .line 132
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->password:Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x3a

    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    .line 135
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->password:Ljava/lang/String;

    sget-object v0, Lorg/apache/commons/vfs2/provider/GenericFileName;->PASSWORD_RESERVED:[C

    invoke-static {p1, p2, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/String;[C)V

    goto :goto_0

    .line 137
    :cond_0
    const-string p2, "***"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_0
    const/16 p2, 0x40

    .line 140
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2
    return-void
.end method

.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 1

    .line 111
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    const-string v0, "://"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/GenericFileName;->appendCredentials(Ljava/lang/StringBuilder;Z)V

    .line 114
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->hostName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    iget p2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getDefaultPort()I

    move-result v0

    if-eq p2, v0, :cond_0

    const/16 p2, 0x3a

    .line 116
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    iget p2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_0
    return-void
.end method

.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 9

    .line 103
    new-instance v0, Lorg/apache/commons/vfs2/provider/GenericFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->hostName:Ljava/lang/String;

    iget v3, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    iget v4, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->defaultPort:I

    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->userName:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->password:Ljava/lang/String;

    move-object v7, p1

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lorg/apache/commons/vfs2/provider/GenericFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method

.method public getDefaultPort()I
    .locals 1

    .line 91
    iget v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->defaultPort:I

    return v0
.end method

.method public getHostName()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 82
    iget v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->port:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/GenericFileName;->userName:Ljava/lang/String;

    return-object v0
.end method
