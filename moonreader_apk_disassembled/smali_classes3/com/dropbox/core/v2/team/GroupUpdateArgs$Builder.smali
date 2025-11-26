.class public Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;
.super Ljava/lang/Object;
.source "GroupUpdateArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/GroupUpdateArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final group:Lcom/dropbox/core/v2/team/GroupSelector;

.field protected newGroupExternalId:Ljava/lang/String;

.field protected newGroupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

.field protected newGroupName:Ljava/lang/String;

.field protected returnMembers:Z


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/team/GroupSelector;)V
    .locals 1

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 163
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->group:Lcom/dropbox/core/v2/team/GroupSelector;

    const/4 p1, 0x1

    .line 164
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->returnMembers:Z

    const/4 p1, 0x0

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupName:Ljava/lang/String;

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupExternalId:Ljava/lang/String;

    .line 167
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

    return-void

    .line 161
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'group\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/GroupUpdateArgs;
    .locals 6

    .line 242
    new-instance v0, Lcom/dropbox/core/v2/team/GroupUpdateArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->group:Lcom/dropbox/core/v2/team/GroupSelector;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->returnMembers:Z

    iget-object v3, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupExternalId:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/team/GroupUpdateArgs;-><init>(Lcom/dropbox/core/v2/team/GroupSelector;ZLjava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamcommon/GroupManagementType;)V

    return-object v0
.end method

.method public withNewGroupExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupExternalId:Ljava/lang/String;

    return-object p0
.end method

.method public withNewGroupManagementType(Lcom/dropbox/core/v2/teamcommon/GroupManagementType;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;
    .locals 0

    .line 231
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

    return-object p0
.end method

.method public withNewGroupName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;
    .locals 0

    .line 203
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->newGroupName:Ljava/lang/String;

    return-object p0
.end method

.method public withReturnMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 186
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->returnMembers:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 189
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->returnMembers:Z

    return-object p0
.end method
