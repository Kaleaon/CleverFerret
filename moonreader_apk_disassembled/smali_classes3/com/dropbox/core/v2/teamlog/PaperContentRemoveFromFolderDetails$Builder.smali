.class public Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;
.super Ljava/lang/Object;
.source "PaperContentRemoveFromFolderDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final eventUuid:Ljava/lang/String;

.field protected parentAssetIndex:Ljava/lang/Long;

.field protected targetAssetIndex:Ljava/lang/Long;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 128
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->eventUuid:Ljava/lang/String;

    const/4 p1, 0x0

    .line 129
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->targetAssetIndex:Ljava/lang/Long;

    .line 130
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->parentAssetIndex:Ljava/lang/Long;

    return-void

    .line 126
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'eventUuid\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails;
    .locals 4

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->eventUuid:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->targetAssetIndex:Ljava/lang/Long;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->parentAssetIndex:Ljava/lang/Long;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    return-object v0
.end method

.method public withParentAssetIndex(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->parentAssetIndex:Ljava/lang/Long;

    return-object p0
.end method

.method public withTargetAssetIndex(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperContentRemoveFromFolderDetails$Builder;->targetAssetIndex:Ljava/lang/Long;

    return-object p0
.end method
