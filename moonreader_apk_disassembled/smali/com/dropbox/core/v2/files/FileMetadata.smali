.class public Lcom/dropbox/core/v2/files/FileMetadata;
.super Lcom/dropbox/core/v2/files/Metadata;
.source "FileMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/FileMetadata$Serializer;,
        Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    }
.end annotation


# instance fields
.field protected final clientModified:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final contentHash:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final hasExplicitSharedMembers:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final id:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final isDownloadable:Z

.field protected final mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final propertyGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final rev:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final serverModified:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final size:J

.field protected final symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;J)V
    .locals 21
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    .line 209
    invoke-direct/range {v0 .. v20}, Lcom/dropbox/core/v2/files/FileMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/files/MediaInfo;Lcom/dropbox/core/v2/files/SymlinkInfo;Lcom/dropbox/core/v2/files/FileSharingInfo;ZLcom/dropbox/core/v2/files/ExportInfo;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;Lcom/dropbox/core/v2/files/FileLockMetadata;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/files/MediaInfo;Lcom/dropbox/core/v2/files/SymlinkInfo;Lcom/dropbox/core/v2/files/FileSharingInfo;ZLcom/dropbox/core/v2/files/ExportInfo;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;Lcom/dropbox/core/v2/files/FileLockMetadata;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Lcom/dropbox/core/v2/files/MediaInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Lcom/dropbox/core/v2/files/SymlinkInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p14    # Lcom/dropbox/core/v2/files/FileSharingInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # Lcom/dropbox/core/v2/files/ExportInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p18    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p19    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p20    # Lcom/dropbox/core/v2/files/FileLockMetadata;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/util/Date;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/files/MediaInfo;",
            "Lcom/dropbox/core/v2/files/SymlinkInfo;",
            "Lcom/dropbox/core/v2/files/FileSharingInfo;",
            "Z",
            "Lcom/dropbox/core/v2/files/ExportInfo;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/files/FileLockMetadata;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p17

    move-object/from16 v1, p19

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    move-object/from16 v7, p11

    .line 129
    invoke-direct/range {v2 .. v7}, Lcom/dropbox/core/v2/files/Metadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_b

    .line 133
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v3, 0x1

    if-lt p1, v3, :cond_a

    .line 136
    iput-object p2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->id:Ljava/lang/String;

    if-eqz p3, :cond_9

    .line 140
    invoke-static {p3}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->clientModified:Ljava/util/Date;

    if-eqz p4, :cond_8

    .line 144
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->serverModified:Ljava/util/Date;

    if-eqz p5, :cond_7

    .line 148
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x9

    if-lt p1, p2, :cond_6

    .line 151
    const-string p1, "[0-9a-f]+"

    invoke-static {p1, p5}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 154
    iput-object p5, p0, Lcom/dropbox/core/v2/files/FileMetadata;->rev:Ljava/lang/String;

    .line 155
    iput-wide p6, p0, Lcom/dropbox/core/v2/files/FileMetadata;->size:J

    move-object/from16 p1, p12

    .line 156
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    move-object/from16 p1, p13

    .line 157
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    move-object/from16 p1, p14

    .line 158
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    move/from16 p1, p15

    .line 159
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->isDownloadable:Z

    move-object/from16 p1, p16

    .line 160
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    if-eqz v0, :cond_1

    .line 162
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/dropbox/core/v2/fileproperties/PropertyGroup;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'propertyGroups\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 168
    :cond_1
    iput-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->propertyGroups:Ljava/util/List;

    move-object/from16 p1, p18

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    if-eqz v1, :cond_4

    .line 171
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x40

    if-lt p1, p2, :cond_3

    .line 174
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    if-gt p1, p2, :cond_2

    goto :goto_1

    .line 175
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 172
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 178
    :cond_4
    :goto_1
    iput-object v1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->contentHash:Ljava/lang/String;

    move-object/from16 p1, p20

    .line 179
    iput-object p1, p0, Lcom/dropbox/core/v2/files/FileMetadata;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    return-void

    .line 152
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 146
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'rev\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 142
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'serverModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 138
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'clientModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 134
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 131
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;J)Lcom/dropbox/core/v2/files/FileMetadata$Builder;
    .locals 8

    .line 457
    new-instance v0, Lcom/dropbox/core/v2/files/FileMetadata$Builder;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/files/FileMetadata$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;J)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 784
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 785
    check-cast p1, Lcom/dropbox/core/v2/files/FileMetadata;

    .line 786
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->id:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 787
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->clientModified:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->clientModified:Ljava/util/Date;

    if-eq v2, v3, :cond_4

    .line 788
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->serverModified:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->serverModified:Ljava/util/Date;

    if-eq v2, v3, :cond_5

    .line 789
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->rev:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->rev:Ljava/lang/String;

    if-eq v2, v3, :cond_6

    .line 790
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_6
    iget-wide v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->size:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/FileMetadata;->size:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    if-eq v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    .line 792
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    if-eq v2, v3, :cond_8

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    .line 793
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    if-eq v2, v3, :cond_9

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    .line 794
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    if-eq v2, v3, :cond_a

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    .line 795
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    if-eq v2, v3, :cond_b

    if-eqz v2, :cond_13

    .line 796
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/MediaInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_b
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    if-eq v2, v3, :cond_c

    if-eqz v2, :cond_13

    .line 797
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/SymlinkInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_c
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    if-eq v2, v3, :cond_d

    if-eqz v2, :cond_13

    .line 798
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/FileSharingInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_d
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->isDownloadable:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->isDownloadable:Z

    if-ne v2, v3, :cond_13

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    if-eq v2, v3, :cond_e

    if-eqz v2, :cond_13

    .line 800
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ExportInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_e
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->propertyGroups:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->propertyGroups:Ljava/util/List;

    if-eq v2, v3, :cond_f

    if-eqz v2, :cond_13

    .line 801
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_f
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_10

    if-eqz v2, :cond_13

    .line 802
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_10
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->contentHash:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileMetadata;->contentHash:Ljava/lang/String;

    if-eq v2, v3, :cond_11

    if-eqz v2, :cond_13

    .line 803
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_11
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileMetadata;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/FileMetadata;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    if-eq v2, p1, :cond_12

    if-eqz v2, :cond_13

    .line 804
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/FileLockMetadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    :cond_12
    return v0

    :cond_13
    return v1
.end method

.method public getClientModified()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->clientModified:Ljava/util/Date;

    return-object v0
.end method

.method public getContentHash()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 417
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->contentHash:Ljava/lang/String;

    return-object v0
.end method

.method public getExportInfo()Lcom/dropbox/core/v2/files/ExportInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 378
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    return-object v0
.end method

.method public getFileLockInfo()Lcom/dropbox/core/v2/files/FileLockMetadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 427
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    return-object v0
.end method

.method public getHasExplicitSharedMembers()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 404
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 230
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getIsDownloadable()Z
    .locals 1

    .line 367
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->isDownloadable:Z

    return v0
.end method

.method public getMediaInfo()Lcom/dropbox/core/v2/files/MediaInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 337
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParentSharedFolderId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 313
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->parentSharedFolderId:Ljava/lang/String;

    return-object v0
.end method

.method public getPathDisplay()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 302
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathDisplay:Ljava/lang/String;

    return-object v0
.end method

.method public getPathLower()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->pathLower:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->previewUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyGroups()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 389
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->propertyGroups:Ljava/util/List;

    return-object v0
.end method

.method public getRev()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->rev:Ljava/lang/String;

    return-object v0
.end method

.method public getServerModified()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 254
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->serverModified:Ljava/util/Date;

    return-object v0
.end method

.method public getSharingInfo()Lcom/dropbox/core/v2/files/FileSharingInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 357
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 275
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->size:J

    return-wide v0
.end method

.method public getSymlinkInfo()Lcom/dropbox/core/v2/files/SymlinkInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 347
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileMetadata;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 17

    move-object/from16 v0, p0

    .line 755
    iget-object v1, v0, Lcom/dropbox/core/v2/files/FileMetadata;->id:Ljava/lang/String;

    iget-object v2, v0, Lcom/dropbox/core/v2/files/FileMetadata;->clientModified:Ljava/util/Date;

    iget-object v3, v0, Lcom/dropbox/core/v2/files/FileMetadata;->serverModified:Ljava/util/Date;

    iget-object v4, v0, Lcom/dropbox/core/v2/files/FileMetadata;->rev:Ljava/lang/String;

    iget-wide v5, v0, Lcom/dropbox/core/v2/files/FileMetadata;->size:J

    .line 760
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-object v6, v0, Lcom/dropbox/core/v2/files/FileMetadata;->mediaInfo:Lcom/dropbox/core/v2/files/MediaInfo;

    iget-object v7, v0, Lcom/dropbox/core/v2/files/FileMetadata;->symlinkInfo:Lcom/dropbox/core/v2/files/SymlinkInfo;

    iget-object v8, v0, Lcom/dropbox/core/v2/files/FileMetadata;->sharingInfo:Lcom/dropbox/core/v2/files/FileSharingInfo;

    iget-boolean v9, v0, Lcom/dropbox/core/v2/files/FileMetadata;->isDownloadable:Z

    .line 764
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iget-object v10, v0, Lcom/dropbox/core/v2/files/FileMetadata;->exportInfo:Lcom/dropbox/core/v2/files/ExportInfo;

    iget-object v11, v0, Lcom/dropbox/core/v2/files/FileMetadata;->propertyGroups:Ljava/util/List;

    iget-object v12, v0, Lcom/dropbox/core/v2/files/FileMetadata;->hasExplicitSharedMembers:Ljava/lang/Boolean;

    iget-object v13, v0, Lcom/dropbox/core/v2/files/FileMetadata;->contentHash:Ljava/lang/String;

    iget-object v14, v0, Lcom/dropbox/core/v2/files/FileMetadata;->fileLockInfo:Lcom/dropbox/core/v2/files/FileLockMetadata;

    const/16 v15, 0xe

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v1, v15, v16

    const/4 v1, 0x1

    aput-object v2, v15, v1

    const/4 v1, 0x2

    aput-object v3, v15, v1

    const/4 v1, 0x3

    aput-object v4, v15, v1

    const/4 v1, 0x4

    aput-object v5, v15, v1

    const/4 v1, 0x5

    aput-object v6, v15, v1

    const/4 v1, 0x6

    aput-object v7, v15, v1

    const/4 v1, 0x7

    aput-object v8, v15, v1

    const/16 v1, 0x8

    aput-object v9, v15, v1

    const/16 v1, 0x9

    aput-object v10, v15, v1

    const/16 v1, 0xa

    aput-object v11, v15, v1

    const/16 v1, 0xb

    aput-object v12, v15, v1

    const/16 v1, 0xc

    aput-object v13, v15, v1

    const/16 v1, 0xd

    aput-object v14, v15, v1

    .line 755
    invoke-static {v15}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    .line 771
    invoke-super {v0}, Lcom/dropbox/core/v2/files/Metadata;->hashCode()I

    move-result v2

    mul-int/lit8 v2, v2, 0x1f

    add-int/2addr v2, v1

    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 814
    sget-object v0, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 826
    sget-object v0, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
