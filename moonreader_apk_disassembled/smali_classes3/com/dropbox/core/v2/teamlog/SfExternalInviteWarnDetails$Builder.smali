.class public Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;
.super Ljava/lang/Object;
.source "SfExternalInviteWarnDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newSharingPermission:Ljava/lang/String;

.field protected final originalFolderName:Ljava/lang/String;

.field protected previousSharingPermission:Ljava/lang/String;

.field protected final targetAssetIndex:J


# direct methods
.method protected constructor <init>(JLjava/lang/String;)V
    .locals 0

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-wide p1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->targetAssetIndex:J

    if-eqz p3, :cond_0

    .line 147
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->originalFolderName:Ljava/lang/String;

    const/4 p1, 0x0

    .line 148
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->newSharingPermission:Ljava/lang/String;

    .line 149
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->previousSharingPermission:Ljava/lang/String;

    return-void

    .line 145
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'originalFolderName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails;
    .locals 6

    .line 183
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails;

    iget-wide v1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->targetAssetIndex:J

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->originalFolderName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->newSharingPermission:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->previousSharingPermission:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withNewSharingPermission(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->newSharingPermission:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousSharingPermission(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;
    .locals 0

    .line 172
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SfExternalInviteWarnDetails$Builder;->previousSharingPermission:Ljava/lang/String;

    return-object p0
.end method
