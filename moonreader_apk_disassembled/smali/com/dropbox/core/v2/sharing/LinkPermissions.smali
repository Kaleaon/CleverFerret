.class public Lcom/dropbox/core/v2/sharing/LinkPermissions;
.super Ljava/lang/Object;
.source "LinkPermissions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;,
        Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    }
.end annotation


# instance fields
.field protected final allowComments:Z

.field protected final allowDownload:Z

.field protected final audienceOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/LinkAudienceOption;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final canAllowDownload:Z

.field protected final canDisallowDownload:Z

.field protected final canRemoveExpiry:Z

.field protected final canRemovePassword:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final canRevoke:Z

.field protected final canSetExpiry:Z

.field protected final canSetPassword:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final canUseExtendedSharingControls:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final requirePassword:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final teamRestrictsComments:Z

.field protected final visibilityPolicies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLjava/util/List;ZZZZZZZ)V
    .locals 20
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;ZZZZZZZ)V"
        }
    .end annotation

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    .line 189
    invoke-direct/range {v0 .. v19}, Lcom/dropbox/core/v2/sharing/LinkPermissions;-><init>(ZLjava/util/List;ZZZZZZZLcom/dropbox/core/v2/sharing/ResolvedVisibility;Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/dropbox/core/v2/sharing/LinkAccessLevel;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(ZLjava/util/List;ZZZZZZZLcom/dropbox/core/v2/sharing/ResolvedVisibility;Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/dropbox/core/v2/sharing/LinkAccessLevel;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p10    # Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Lcom/dropbox/core/v2/sharing/RequestedVisibility;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p14    # Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p18    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p19    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;ZZZZZZZ",
            "Lcom/dropbox/core/v2/sharing/ResolvedVisibility;",
            "Lcom/dropbox/core/v2/sharing/RequestedVisibility;",
            "Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;",
            "Lcom/dropbox/core/v2/sharing/LinkAudience;",
            "Lcom/dropbox/core/v2/sharing/LinkAccessLevel;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/LinkAudienceOption;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p15

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p10, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 124
    iput-object p11, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    .line 125
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRevoke:Z

    .line 126
    iput-object p12, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 127
    iput-object p13, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 128
    iput-object p14, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    if-eqz p2, :cond_4

    .line 132
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p10

    if-eqz p10, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p10

    check-cast p10, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    if-eqz p10, :cond_0

    goto :goto_0

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'visibilityPolicies\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 137
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->visibilityPolicies:Ljava/util/List;

    .line 138
    iput-boolean p3, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetExpiry:Z

    .line 139
    iput-boolean p4, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemoveExpiry:Z

    .line 140
    iput-boolean p5, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowDownload:Z

    .line 141
    iput-boolean p6, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canAllowDownload:Z

    .line 142
    iput-boolean p7, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canDisallowDownload:Z

    .line 143
    iput-boolean p8, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowComments:Z

    .line 144
    iput-boolean p9, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->teamRestrictsComments:Z

    if-eqz v0, :cond_3

    .line 146
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;

    if-eqz p2, :cond_2

    goto :goto_1

    .line 148
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'audienceOptions\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 152
    :cond_3
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->audienceOptions:Ljava/util/List;

    move-object/from16 p1, p16

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetPassword:Ljava/lang/Boolean;

    move-object/from16 p1, p17

    .line 154
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemovePassword:Ljava/lang/Boolean;

    move-object/from16 p1, p18

    .line 155
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requirePassword:Ljava/lang/Boolean;

    move-object/from16 p1, p19

    .line 156
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    return-void

    .line 130
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'visibilityPolicies\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(ZLjava/util/List;ZZZZZZZ)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;ZZZZZZZ)",
            "Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;"
        }
    .end annotation

    .line 429
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;

    move v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;-><init>(ZLjava/util/List;ZZZZZZZ)V

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

    .line 691
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 692
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;

    .line 693
    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRevoke:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRevoke:Z

    if-ne v2, v3, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->visibilityPolicies:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->visibilityPolicies:Ljava/util/List;

    if-eq v2, v3, :cond_2

    .line 694
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetExpiry:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetExpiry:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemoveExpiry:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemoveExpiry:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowDownload:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowDownload:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canAllowDownload:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canAllowDownload:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canDisallowDownload:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canDisallowDownload:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowComments:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowComments:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->teamRestrictsComments:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->teamRestrictsComments:Z

    if-ne v2, v3, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_d

    .line 702
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_d

    .line 703
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/RequestedVisibility;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_d

    .line 704
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    if-eq v2, v3, :cond_6

    if-eqz v2, :cond_d

    .line 705
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/LinkAudience;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    if-eq v2, v3, :cond_7

    if-eqz v2, :cond_d

    .line 706
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->audienceOptions:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->audienceOptions:Ljava/util/List;

    if-eq v2, v3, :cond_8

    if-eqz v2, :cond_d

    .line 707
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetPassword:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetPassword:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_9

    if-eqz v2, :cond_d

    .line 708
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemovePassword:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemovePassword:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_a

    if-eqz v2, :cond_d

    .line 709
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requirePassword:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requirePassword:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_b

    if-eqz v2, :cond_d

    .line 710
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_b
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    if-eq v2, p1, :cond_c

    if-eqz v2, :cond_d

    .line 711
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    :cond_c
    return v0

    :cond_d
    return v1
.end method

.method public getAllowComments()Z
    .locals 1

    .line 266
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowComments:Z

    return v0
.end method

.method public getAllowDownload()Z
    .locals 1

    .line 236
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowDownload:Z

    return v0
.end method

.method public getAudienceOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/LinkAudienceOption;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 355
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->audienceOptions:Ljava/util/List;

    return-object v0
.end method

.method public getCanAllowDownload()Z
    .locals 1

    .line 246
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canAllowDownload:Z

    return v0
.end method

.method public getCanDisallowDownload()Z
    .locals 1

    .line 256
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canDisallowDownload:Z

    return v0
.end method

.method public getCanRemoveExpiry()Z
    .locals 1

    .line 227
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemoveExpiry:Z

    return v0
.end method

.method public getCanRemovePassword()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 375
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemovePassword:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanRevoke()Z
    .locals 1

    .line 198
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRevoke:Z

    return v0
.end method

.method public getCanSetExpiry()Z
    .locals 1

    .line 218
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetExpiry:Z

    return v0
.end method

.method public getCanSetPassword()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 365
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetPassword:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanUseExtendedSharingControls()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 396
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getEffectiveAudience()Lcom/dropbox/core/v2/sharing/LinkAudience;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 327
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object v0
.end method

.method public getLinkAccessLevel()Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 344
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    return-object v0
.end method

.method public getRequestedVisibility()Lcom/dropbox/core/v2/sharing/RequestedVisibility;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 305
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    return-object v0
.end method

.method public getRequirePassword()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 385
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requirePassword:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getResolvedVisibility()Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 290
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    return-object v0
.end method

.method public getRevokeFailureReason()Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 316
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    return-object v0
.end method

.method public getTeamRestrictsComments()Z
    .locals 1

    .line 275
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->teamRestrictsComments:Z

    return v0
.end method

.method public getVisibilityPolicies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->visibilityPolicies:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 21

    move-object/from16 v0, p0

    .line 658
    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    iget-object v2, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-boolean v3, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRevoke:Z

    .line 661
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget-object v4, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    iget-object v5, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v6, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    iget-object v7, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->visibilityPolicies:Ljava/util/List;

    iget-boolean v8, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetExpiry:Z

    .line 666
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-boolean v9, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemoveExpiry:Z

    .line 667
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iget-boolean v10, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowDownload:Z

    .line 668
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    iget-boolean v11, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canAllowDownload:Z

    .line 669
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    iget-boolean v12, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canDisallowDownload:Z

    .line 670
    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    iget-boolean v13, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->allowComments:Z

    .line 671
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    iget-boolean v14, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->teamRestrictsComments:Z

    .line 672
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iget-object v15, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->audienceOptions:Ljava/util/List;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canSetPassword:Ljava/lang/Boolean;

    move-object/from16 v17, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canRemovePassword:Ljava/lang/Boolean;

    move-object/from16 v18, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->requirePassword:Ljava/lang/Boolean;

    move-object/from16 v19, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/Object;

    const/16 v20, 0x0

    aput-object v16, v0, v20

    const/16 v16, 0x1

    aput-object v2, v0, v16

    const/4 v2, 0x2

    aput-object v3, v0, v2

    const/4 v2, 0x3

    aput-object v4, v0, v2

    const/4 v2, 0x4

    aput-object v5, v0, v2

    const/4 v2, 0x5

    aput-object v6, v0, v2

    const/4 v2, 0x6

    aput-object v7, v0, v2

    const/4 v2, 0x7

    aput-object v8, v0, v2

    const/16 v2, 0x8

    aput-object v9, v0, v2

    const/16 v2, 0x9

    aput-object v10, v0, v2

    const/16 v2, 0xa

    aput-object v11, v0, v2

    const/16 v2, 0xb

    aput-object v12, v0, v2

    const/16 v2, 0xc

    aput-object v13, v0, v2

    const/16 v2, 0xd

    aput-object v14, v0, v2

    const/16 v2, 0xe

    aput-object v15, v0, v2

    const/16 v2, 0xf

    aput-object v17, v0, v2

    const/16 v2, 0x10

    aput-object v18, v0, v2

    const/16 v2, 0x11

    aput-object v19, v0, v2

    const/16 v2, 0x12

    aput-object v1, v0, v2

    .line 658
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 721
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 733
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkPermissions$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
