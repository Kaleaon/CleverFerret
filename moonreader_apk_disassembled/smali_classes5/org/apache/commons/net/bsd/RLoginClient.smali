.class public Lorg/apache/commons/net/bsd/RLoginClient;
.super Lorg/apache/commons/net/bsd/RCommandClient;
.source "RLoginClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x201


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 78
    invoke-direct {p0}, Lorg/apache/commons/net/bsd/RCommandClient;-><init>()V

    const/16 v0, 0x201

    .line 79
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/bsd/RLoginClient;->setDefaultPort(I)V

    return-void
.end method


# virtual methods
.method public rlogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 130
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/net/bsd/RLoginClient;->rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public rlogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "/"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 p4, 0x0

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/net/bsd/RLoginClient;->rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
