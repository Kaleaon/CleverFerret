.class public Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;
.super Ljava/lang/Object;
.source "RevokeDeviceSessionStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;
    }
.end annotation


# instance fields
.field protected final errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final success:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;-><init>(ZLcom/dropbox/core/v2/team/RevokeDeviceSessionError;)V

    return-void
.end method

.method public constructor <init>(ZLcom/dropbox/core/v2/team/RevokeDeviceSessionError;)V
    .locals 0
    .param p2    # Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->success:Z

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;

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

    .line 87
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 88
    check-cast p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;

    .line 89
    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->success:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->success:Z

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;

    if-eq v2, p1, :cond_2

    if-eqz v2, :cond_3

    .line 90
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    return v0

    :cond_3
    return v1
.end method

.method public getErrorType()Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;

    return-object v0
.end method

.method public getSuccess()Z
    .locals 1

    .line 56
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->success:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 71
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->success:Z

    .line 72
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus;->errorType:Lcom/dropbox/core/v2/team/RevokeDeviceSessionError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 71
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 100
    sget-object v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 112
    sget-object v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
