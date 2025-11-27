.class public Lcom/dropbox/core/v2/files/FileMetadata$Builder;
.super Lcom/dropbox/core/v2/files/Metadata$Builder;
.source "FileMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/FileMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final clientModified:Ljava/util/Date;

.field protected contentHash:Ljava/lang/String;

.field protected exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

.field protected fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

.field protected hasExplicitSharedMembers:Ljava/lang/Boolean;

.field protected final id:Ljava/lang/String;

.field protected isDownloadable:Z

.field protected mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

.field protected propertyGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;"
        }
    .end annotation
.end field

.field protected final rev:Ljava/lang/String;

.field protected final serverModified:Ljava/util/Date;

.field protected sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

.field protected final size:J

.field protected symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;J)V
    .locals 1

    .line 481
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_6

    .line 485
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_5

    .line 488
    iput-object p2, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->id:Ljava/lang/String;

    if-eqz p3, :cond_4

    .line 492
    invoke-static {p3}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->clientModified:Ljava/util/Date;

    if-eqz p4, :cond_3

    .line 496
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->serverModified:Ljava/util/Date;

    if-eqz p5, :cond_2

    .line 500
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x9

    if-lt p1, p2, :cond_1

    .line 503
    const-string p1, "[0-9a-f]+"

    invoke-static {p1, p5}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 506
    iput-object p5, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->rev:Ljava/lang/String;

    .line 507
    iput-wide p6, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->size:J

    const/4 p1, 0x0

    .line 508
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    .line 509
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    .line 510
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    .line 511
    iput-boolean v0, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->isDownloadable:Z

    .line 512
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    .line 513
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->propertyGroups:Ljava/util/List;

    .line 514
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    .line 515
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->contentHash:Ljava/lang/String;

    .line 516
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    return-void

    .line 504
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 501
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 498
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'rev\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 494
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'serverModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 490
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'clientModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 486
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 483
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 23

    move-object/from16 v0, p0

    .line 749
    new-instance v1, Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object v2, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->name:Ljava/lang/String;

    iget-object v3, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->id:Ljava/lang/String;

    iget-object v4, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->clientModified:Ljava/util/Date;

    iget-object v5, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->serverModified:Ljava/util/Date;

    iget-object v6, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->rev:Ljava/lang/String;

    iget-wide v7, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->size:J

    iget-object v9, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->pathLower:Ljava/lang/String;

    iget-object v10, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->pathDisplay:Ljava/lang/String;

    iget-object v11, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->parentSharedFolderId:Ljava/lang/String;

    iget-object v12, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->previewUrl:Ljava/lang/String;

    iget-object v13, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    iget-object v14, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    iget-object v15, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    move-object/from16 v16, v1

    iget-boolean v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->isDownloadable:Z

    move/from16 v17, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    move-object/from16 v18, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->propertyGroups:Ljava/util/List;

    move-object/from16 v19, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    move-object/from16 v20, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->contentHash:Ljava/lang/String;

    move-object/from16 v21, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    move-object/from16 v22, v21

    move-object/from16 v21, v1

    move-object/from16 v1, v16

    move/from16 v16, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v22

    invoke-direct/range {v1 .. v21}, Lcom/dropbox/core/v2/files/FileMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/files/MediaInfo;Lcom/dropbox/core/v2/files/SymlinkInfo;Lcom/dropbox/core/v2/files/FileSharingInfo;ZLcom/dropbox/core/v2/files/ExportInfo;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;Lcom/dropbox/core/v2/files/FileLockMetadata;)V

    move-object/from16 v16, v1

    return-object v16
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/files/Metadata;
    .locals 1

    .line 463
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->build()Lcom/dropbox/core/v2/files/FileMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 655
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 658
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 659
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 656
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 662
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->contentHash:Ljava/lang/String;

    return-object p0
.end method

.method public withExportInfo(Lcom/dropbox/core/v2/files/ExportInfo;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 592
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    return-object p0
.end method

.method public withFileLockInfo(Lcom/dropbox/core/v2/files/FileLockMetadata;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 675
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    return-object p0
.end method

.method public withHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 635
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withIsDownloadable(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 574
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->isDownloadable:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 577
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->isDownloadable:Z

    return-object p0
.end method

.method public withMediaInfo(Lcom/dropbox/core/v2/files/MediaInfo;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 532
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    return-object p0
.end method

.method public withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 726
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 463
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 708
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 463
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 689
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 463
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 738
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 463
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)",
            "Lcom/dropbox/core/v2/files/FileMetadata$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 610
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/fileproperties/PropertyGroup;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 612
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'propertyGroups\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 616
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->propertyGroups:Ljava/util/List;

    return-object p0
.end method

.method public withSharingInfo(Lcom/dropbox/core/v2/files/FileSharingInfo;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 556
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    return-object p0
.end method

.method public withSymlinkInfo(Lcom/dropbox/core/v2/files/SymlinkInfo;)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 0

    .line 544
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    return-object p0
.end method
