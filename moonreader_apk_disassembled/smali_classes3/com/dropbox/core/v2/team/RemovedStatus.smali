.class public Lcom/dropbox/core/v2/team/RemovedStatus;
.super Ljava/lang/Object;
.source "RemovedStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;
    }
.end annotation


# instance fields
.field protected final isDisconnected:Z

.field protected final isRecoverable:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isRecoverable:Z

    .line 33
    iput-boolean p2, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isDisconnected:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 72
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 73
    check-cast p1, Lcom/dropbox/core/v2/team/RemovedStatus;

    .line 74
    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isRecoverable:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/team/RemovedStatus;->isRecoverable:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isDisconnected:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/team/RemovedStatus;->isDisconnected:Z

    if-ne v2, p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getIsDisconnected()Z
    .locals 1

    .line 51
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isDisconnected:Z

    return v0
.end method

.method public getIsRecoverable()Z
    .locals 1

    .line 42
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isRecoverable:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 56
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isRecoverable:Z

    .line 57
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-boolean v1, p0, Lcom/dropbox/core/v2/team/RemovedStatus;->isDisconnected:Z

    .line 58
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 56
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 85
    sget-object v0, Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 97
    sget-object v0, Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RemovedStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
