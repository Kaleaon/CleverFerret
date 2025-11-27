.class public Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;
.super Ljava/lang/Object;
.source "HostFileNameParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/HostFileNameParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Authority"
.end annotation


# instance fields
.field private hostName:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private port:I

.field private scheme:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;
    .locals 0

    .line 216
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->scheme:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$002(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 216
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->scheme:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;
    .locals 0

    .line 216
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->hostName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$102(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 216
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->hostName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)I
    .locals 0

    .line 216
    iget p0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->port:I

    return p0
.end method

.method static synthetic access$202(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;I)I
    .locals 0

    .line 216
    iput p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->port:I

    return p1
.end method

.method static synthetic access$300(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;
    .locals 0

    .line 216
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->userName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$302(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 216
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->userName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;
    .locals 0

    .line 216
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->password:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$402(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 216
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->password:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public getHostName()Ljava/lang/String;
    .locals 1

    .line 250
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 290
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 310
    iget v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->port:I

    return v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 270
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setHostName(Ljava/lang/String;)V
    .locals 0

    .line 260
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->hostName:Ljava/lang/String;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .line 300
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->password:Ljava/lang/String;

    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 320
    iput p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->port:I

    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->scheme:Ljava/lang/String;

    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0

    .line 280
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->userName:Ljava/lang/String;

    return-void
.end method
