.class public Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
.super Ljava/lang/Object;
.source "MemberChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

.field protected newTeam:Ljava/lang/String;

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

.field protected previousTeam:Ljava/lang/String;

.field protected previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;)V
    .locals 1

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    const/4 p1, 0x0

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    .line 167
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    .line 168
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->newTeam:Ljava/lang/String;

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousTeam:Ljava/lang/String;

    return-void

    .line 163
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'newValue\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;
    .locals 6

    .line 231
    new-instance v0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->newTeam:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousTeam:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails;-><init>(Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/MemberStatus;Lcom/dropbox/core/v2/teamlog/ActionDetails;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withAction(Lcom/dropbox/core/v2/teamlog/ActionDetails;)Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    .locals 0

    .line 194
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->action:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    return-object p0
.end method

.method public withNewTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->newTeam:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    .locals 0

    .line 220
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousTeam:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousValue(Lcom/dropbox/core/v2/teamlog/MemberStatus;)Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/MemberStatus;

    return-object p0
.end method
