.class public Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;
.super Ljava/lang/Object;
.source "FoldersContainingPaperDoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected folderSharingPolicyType:Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;

.field protected folders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/Folder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folderSharingPolicyType:Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;

    .line 108
    iput-object v0, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folders:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;
    .locals 3

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folderSharingPolicyType:Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folders:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;-><init>(Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;Ljava/util/List;)V

    return-object v0
.end method

.method public withFolderSharingPolicyType(Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;)Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folderSharingPolicyType:Lcom/dropbox/core/v2/paper/FolderSharingPolicyType;

    return-object p0
.end method

.method public withFolders(Ljava/util/List;)Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/Folder;",
            ">;)",
            "Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 137
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/paper/Folder;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'folders\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 143
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Builder;->folders:Ljava/util/List;

    return-object p0
.end method
