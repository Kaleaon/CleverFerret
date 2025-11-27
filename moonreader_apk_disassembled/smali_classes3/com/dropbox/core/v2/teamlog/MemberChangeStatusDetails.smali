.class public Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;
.super Ljava/lang/Object;
.source "MemberChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    }
.end annotation


# instance fields
.field protected final action:Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final newTeam:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousTeam:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;)V
    .locals 6
    .param p1    # Lcom/dropbox/core/v2/teamlog/MemberStatus;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 80
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;-><init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/ActionDetails;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/ActionDetails;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/MemberStatus;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/MemberStatus;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/ActionDetails;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    if-eqz p1, :cond_0

    .line 63
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    .line 64
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    .line 65
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newTeam:Ljava/lang/String;

    .line 66
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousTeam:Ljava/lang/String;

    return-void

    .line 61
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/teamlog/MemberStatus;)Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    .locals 1

    .line 147
    new-instance v0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;)V

    return-object v0
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

    .line 256
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 257
    check-cast p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;

    .line 258
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/MemberStatus;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_6

    .line 259
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/MemberStatus;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_6

    .line 260
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/ActionDetails;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newTeam:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newTeam:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_6

    .line 261
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousTeam:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousTeam:Ljava/lang/String;

    if-eq v2, p1, :cond_7

    if-eqz v2, :cond_6

    .line 262
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    return v1

    :cond_7
    :goto_0
    return v0

    :cond_8
    return v1
.end method

.method public getAction()Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    return-object v0
.end method

.method public getNewTeam()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newTeam:Ljava/lang/String;

    return-object v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/MemberStatus;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    return-object v0
.end method

.method public getPreviousTeam()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousTeam:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/MemberStatus;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->newTeam:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;->previousTeam:Ljava/lang/String;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 272
    sget-object v0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 284
    sget-object v0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
