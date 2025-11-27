.class public Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
.super Ljava/lang/Object;
.source "LinkPermissions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/LinkPermissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final allowComments:Z

.field protected final allowDownload:Z

.field protected audienceOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/LinkAudienceOption;",
            ">;"
        }
    .end annotation
.end field

.field protected final canAllowDownload:Z

.field protected final canDisallowDownload:Z

.field protected final canRemoveExpiry:Z

.field protected canRemovePassword:Ljava/lang/Boolean;

.field protected final canRevoke:Z

.field protected final canSetExpiry:Z

.field protected canSetPassword:Ljava/lang/Boolean;

.field protected canUseExtendedSharingControls:Ljava/lang/Boolean;

.field protected effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

.field protected linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

.field protected requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

.field protected requirePassword:Ljava/lang/Boolean;

.field protected resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field protected revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field protected final teamRestrictsComments:Z

.field protected final visibilityPolicies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(ZLjava/util/List;ZZZZZZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/VisibilityPolicy;",
            ">;ZZZZZZZ)V"
        }
    .end annotation

    .line 457
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 458
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRevoke:Z

    if-eqz p2, :cond_2

    .line 462
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 464
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'visibilityPolicies\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 467
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->visibilityPolicies:Ljava/util/List;

    .line 468
    iput-boolean p3, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canSetExpiry:Z

    .line 469
    iput-boolean p4, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRemoveExpiry:Z

    .line 470
    iput-boolean p5, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->allowDownload:Z

    .line 471
    iput-boolean p6, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canAllowDownload:Z

    .line 472
    iput-boolean p7, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canDisallowDownload:Z

    .line 473
    iput-boolean p8, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->allowComments:Z

    .line 474
    iput-boolean p9, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->teamRestrictsComments:Z

    const/4 p1, 0x0

    .line 475
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 476
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    .line 477
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 478
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 479
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    .line 480
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->audienceOptions:Ljava/util/List;

    .line 481
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canSetPassword:Ljava/lang/Boolean;

    .line 482
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRemovePassword:Ljava/lang/Boolean;

    .line 483
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requirePassword:Ljava/lang/Boolean;

    .line 484
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    return-void

    .line 460
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'visibilityPolicies\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/LinkPermissions;
    .locals 22

    move-object/from16 v0, p0

    .line 652
    new-instance v1, Lcom/dropbox/core/v2/sharing/LinkPermissions;

    iget-boolean v2, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRevoke:Z

    iget-object v3, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->visibilityPolicies:Ljava/util/List;

    iget-boolean v4, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canSetExpiry:Z

    iget-boolean v5, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRemoveExpiry:Z

    iget-boolean v6, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->allowDownload:Z

    iget-boolean v7, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canAllowDownload:Z

    iget-boolean v8, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canDisallowDownload:Z

    iget-boolean v9, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->allowComments:Z

    iget-boolean v10, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->teamRestrictsComments:Z

    iget-object v11, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    iget-object v12, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-object v13, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    iget-object v14, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v15, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->audienceOptions:Ljava/util/List;

    move-object/from16 v17, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canSetPassword:Ljava/lang/Boolean;

    move-object/from16 v18, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRemovePassword:Ljava/lang/Boolean;

    move-object/from16 v19, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requirePassword:Ljava/lang/Boolean;

    move-object/from16 v20, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    move-object/from16 v21, v20

    move-object/from16 v20, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v21

    invoke-direct/range {v1 .. v20}, Lcom/dropbox/core/v2/sharing/LinkPermissions;-><init>(ZLjava/util/List;ZZZZZZZLcom/dropbox/core/v2/sharing/ResolvedVisibility;Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/dropbox/core/v2/sharing/LinkAccessLevel;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    move-object/from16 v16, v1

    return-object v16
.end method

.method public withAudienceOptions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/LinkAudienceOption;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 583
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 585
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'audienceOptions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 589
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->audienceOptions:Ljava/util/List;

    return-object p0
.end method

.method public withCanRemovePassword(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 615
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canRemovePassword:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withCanSetPassword(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 602
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canSetPassword:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withCanUseExtendedSharingControls(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 641
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->canUseExtendedSharingControls:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withEffectiveAudience(Lcom/dropbox/core/v2/sharing/LinkAudience;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 545
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->effectiveAudience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object p0
.end method

.method public withLinkAccessLevel(Lcom/dropbox/core/v2/sharing/LinkAccessLevel;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 565
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->linkAccessLevel:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    return-object p0
.end method

.method public withRequestedVisibility(Lcom/dropbox/core/v2/sharing/RequestedVisibility;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 518
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    return-object p0
.end method

.method public withRequirePassword(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 628
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->requirePassword:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withResolvedVisibility(Lcom/dropbox/core/v2/sharing/ResolvedVisibility;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 501
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->resolvedVisibility:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    return-object p0
.end method

.method public withRevokeFailureReason(Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;)Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;
    .locals 0

    .line 532
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkPermissions$Builder;->revokeFailureReason:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    return-object p0
.end method
