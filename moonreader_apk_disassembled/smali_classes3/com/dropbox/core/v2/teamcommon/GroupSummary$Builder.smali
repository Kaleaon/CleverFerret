.class public Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;
.super Ljava/lang/Object;
.source "GroupSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamcommon/GroupSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected groupExternalId:Ljava/lang/String;

.field protected final groupId:Ljava/lang/String;

.field protected final groupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

.field protected final groupName:Ljava/lang/String;

.field protected memberCount:Ljava/lang/Long;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamcommon/GroupManagementType;)V
    .locals 0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 171
    iput-object p1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupName:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 175
    iput-object p2, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupId:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 179
    iput-object p3, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

    const/4 p1, 0x0

    .line 180
    iput-object p1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupExternalId:Ljava/lang/String;

    .line 181
    iput-object p1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->memberCount:Ljava/lang/Long;

    return-void

    .line 177
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'groupManagementType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 173
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'groupId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'groupName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamcommon/GroupSummary;
    .locals 6

    .line 216
    new-instance v0, Lcom/dropbox/core/v2/teamcommon/GroupSummary;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupManagementType:Lcom/dropbox/core/v2/teamcommon/GroupManagementType;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupExternalId:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->memberCount:Ljava/lang/Long;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamcommon/GroupSummary;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamcommon/GroupManagementType;Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public withGroupExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;
    .locals 0

    .line 193
    iput-object p1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->groupExternalId:Ljava/lang/String;

    return-object p0
.end method

.method public withMemberCount(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;
    .locals 0

    .line 205
    iput-object p1, p0, Lcom/dropbox/core/v2/teamcommon/GroupSummary$Builder;->memberCount:Ljava/lang/Long;

    return-object p0
.end method
