.class public Lorg/apache/commons/net/ProtocolCommandEvent;
.super Ljava/util/EventObject;
.source "ProtocolCommandEvent.java"


# static fields
.field private static final serialVersionUID:J = 0x59a629bebd214a8L


# instance fields
.field private final command:Ljava/lang/String;

.field private final isCommand:Z

.field private final message:Ljava/lang/String;

.field private final replyCode:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;ILjava/lang/String;)V
    .locals 0

    .line 81
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 82
    iput p2, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->replyCode:I

    .line 83
    iput-object p3, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->message:Ljava/lang/String;

    const/4 p1, 0x0

    .line 84
    iput-boolean p1, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->isCommand:Z

    const/4 p1, 0x0

    .line 85
    iput-object p1, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->command:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 58
    iput p1, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->replyCode:I

    .line 59
    iput-object p3, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->message:Ljava/lang/String;

    const/4 p1, 0x1

    .line 60
    iput-boolean p1, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->isCommand:Z

    .line 61
    iput-object p2, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->command:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCommand()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->command:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getReplyCode()I
    .locals 1

    .line 111
    iget v0, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->replyCode:I

    return v0
.end method

.method public isCommand()Z
    .locals 1

    .line 123
    iget-boolean v0, p0, Lorg/apache/commons/net/ProtocolCommandEvent;->isCommand:Z

    return v0
.end method

.method public isReply()Z
    .locals 1

    .line 135
    invoke-virtual {p0}, Lorg/apache/commons/net/ProtocolCommandEvent;->isCommand()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
