.class public Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;
.super Ljava/lang/Object;
.source "PaperFolderCreateArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected isTeamFolder:Ljava/lang/Boolean;

.field protected final name:Ljava/lang/String;

.field protected parentFolderId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 136
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->name:Ljava/lang/String;

    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->parentFolderId:Ljava/lang/String;

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->isTeamFolder:Ljava/lang/Boolean;

    return-void

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'name\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;
    .locals 4

    .line 180
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->parentFolderId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->isTeamFolder:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withIsTeamFolder(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->isTeamFolder:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withParentFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->parentFolderId:Ljava/lang/String;

    return-object p0
.end method
