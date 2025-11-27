.class public Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;
.super Ljava/lang/Object;
.source "SharedFolderNestDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newNsPath:Ljava/lang/String;

.field protected newParentNsId:Ljava/lang/String;

.field protected previousNsPath:Ljava/lang/String;

.field protected previousParentNsId:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 124
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousParentNsId:Ljava/lang/String;

    .line 125
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newParentNsId:Ljava/lang/String;

    .line 126
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousNsPath:Ljava/lang/String;

    .line 127
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newNsPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails;
    .locals 5

    .line 185
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousParentNsId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newParentNsId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousNsPath:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newNsPath:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withNewNsPath(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;
    .locals 0

    .line 174
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newNsPath:Ljava/lang/String;

    return-object p0
.end method

.method public withNewParentNsId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;
    .locals 0

    .line 150
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->newParentNsId:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousNsPath(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;
    .locals 0

    .line 162
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousNsPath:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousParentNsId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;
    .locals 0

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedFolderNestDetails$Builder;->previousParentNsId:Ljava/lang/String;

    return-object p0
.end method
