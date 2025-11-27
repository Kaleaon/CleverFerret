.class public abstract Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;
.super Lorg/apache/commons/vfs2/tasks/VfsTask;
.source "AbstractSyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;
    }
.end annotation


# instance fields
.field private destDirUrl:Ljava/lang/String;

.field private destFileUrl:Ljava/lang/String;

.field private failonerror:Z

.field private filesList:Ljava/lang/String;

.field private srcDirIsBase:Z

.field private srcDirUrl:Ljava/lang/String;

.field private final srcFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/VfsTask;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->failonerror:Z

    return-void
.end method

.method private handleFile(Ljava/util/Set;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;",
            "Lorg/apache/commons/vfs2/FileObject;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 302
    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    const-string p1, "vfs.tasks/sync.duplicate-source-files.warn"

    invoke-static {p1, p3}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    .line 304
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    goto :goto_0

    .line 306
    :cond_0
    invoke-interface {p1, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 310
    :goto_0
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method private handleFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 343
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 344
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    goto :goto_0

    .line 349
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleUpToDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-void

    .line 346
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleOutOfDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method private handleFiles()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 220
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destDirUrl:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 221
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V

    .line 225
    iget-object v1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 226
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 228
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 229
    :goto_1
    iget-object v5, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 231
    iget-object v5, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;

    .line 232
    invoke-static {v5}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->access$000(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v5

    .line 233
    invoke-interface {v5}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    .line 234
    const-string v6, "vfs.tasks/sync.src-file-no-exist.warn"

    invoke-static {v6, v5}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    .line 236
    invoke-virtual {p0, v5, v6}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    goto :goto_2

    .line 238
    :cond_1
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 243
    :cond_2
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    const/4 v5, 0x0

    .line 244
    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_a

    .line 245
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/vfs2/FileObject;

    .line 246
    invoke-interface {v6}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v7

    .line 248
    invoke-interface {v6}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result v8

    if-eqz v8, :cond_5

    if-eqz v1, :cond_4

    .line 251
    iget-boolean v8, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirIsBase:Z

    if-nez v8, :cond_3

    goto :goto_4

    .line 254
    :cond_3
    invoke-interface {v1, v7}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v7

    goto :goto_5

    .line 252
    :cond_4
    :goto_4
    invoke-interface {v7}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v7

    .line 256
    :goto_5
    sget-object v8, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v0, v7, v8}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v7

    .line 259
    invoke-direct {p0, v4, v6, v7}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleFile(Ljava/util/Set;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_a

    .line 263
    :cond_5
    iget-boolean v8, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirIsBase:Z

    if-eqz v8, :cond_6

    sget-object v8, Lorg/apache/commons/vfs2/Selectors;->SELECT_ALL:Lorg/apache/commons/vfs2/FileSelector;

    goto :goto_6

    :cond_6
    sget-object v8, Lorg/apache/commons/vfs2/Selectors;->SELECT_FILES:Lorg/apache/commons/vfs2/FileSelector;

    .line 264
    :goto_6
    invoke-interface {v6, v8}, Lorg/apache/commons/vfs2/FileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v6

    .line 266
    array-length v8, v6

    const/4 v9, 0x0

    :goto_7
    if-ge v9, v8, :cond_9

    aget-object v10, v6, v9

    if-eqz v1, :cond_8

    .line 269
    iget-boolean v11, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirIsBase:Z

    if-nez v11, :cond_7

    goto :goto_8

    .line 272
    :cond_7
    invoke-interface {v10}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v11

    invoke-interface {v1, v11}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v11

    goto :goto_9

    .line 270
    :cond_8
    :goto_8
    invoke-interface {v10}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v11

    invoke-interface {v7, v11}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v11

    .line 275
    :goto_9
    sget-object v12, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v0, v11, v12}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v11

    .line 278
    invoke-direct {p0, v4, v10, v11}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleFile(Ljava/util/Set;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    :cond_9
    :goto_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 284
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->detectMissingSourceFiles()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 285
    sget-object v1, Lorg/apache/commons/vfs2/Selectors;->SELECT_FILES:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 286
    array-length v1, v0

    :goto_b
    if-ge v3, v1, :cond_c

    aget-object v2, v0, v3

    .line 287
    invoke-interface {v4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 288
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleMissingSourceFile(Lorg/apache/commons/vfs2/FileObject;)V

    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_c
    return-void
.end method

.method private handleSingleFile()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 319
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 320
    const-string v0, "vfs.tasks/sync.too-many-source-files.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 321
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    return-void

    .line 324
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;

    .line 325
    invoke-static {v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->access$000(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 326
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    .line 327
    const-string v2, "vfs.tasks/sync.source-not-file.error"

    invoke-static {v2, v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 328
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    return-void

    .line 333
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destFileUrl:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 336
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method


# virtual methods
.method public addConfiguredSrc(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .line 140
    invoke-static {p1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->access$000(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 141
    :cond_0
    const-string p1, "vfs.tasks/sync.no-source-file.error"

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 142
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected detectMissingSourceFiles()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destFileUrl:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destDirUrl:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 156
    const-string v0, "vfs.tasks/sync.no-destination.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    return-void

    :cond_0
    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destDirUrl:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 162
    const-string v0, "vfs.tasks/sync.too-many-destinations.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 163
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    return-void

    .line 168
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destDirUrl:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->filesList:Ljava/lang/String;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    .line 169
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    .line 172
    :cond_2
    new-instance v0, Ljava/util/StringTokenizer;

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->filesList:Ljava/lang/String;

    const-string v3, ", \t\n\r\u000c"

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 173
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 174
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 177
    const-string v3, "/**"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 178
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 181
    :cond_3
    new-instance v3, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;

    invoke-direct {v3}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;-><init>()V

    .line 182
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->setFile(Ljava/lang/String;)V

    .line 183
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->addConfiguredSrc(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)V

    goto :goto_0

    .line 187
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_5

    .line 188
    const-string v0, "vfs.tasks/sync.no-source-files.warn"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->logOrDie(Ljava/lang/String;I)V

    return-void

    .line 195
    :cond_5
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destFileUrl:Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 196
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleSingleFile()V

    return-void

    .line 198
    :cond_6
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->handleFiles()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 203
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 201
    throw v0
.end method

.method protected handleMissingSourceFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected handleOutOfDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected handleUpToDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method public isFailonerror()Z
    .locals 1

    .line 121
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->failonerror:Z

    return v0
.end method

.method protected logOrDie(Ljava/lang/String;I)V
    .locals 1

    .line 208
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->isFailonerror()Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->log(Ljava/lang/String;I)V

    return-void

    .line 212
    :cond_0
    new-instance p2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {p2, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setDestDir(Ljava/lang/String;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destDirUrl:Ljava/lang/String;

    return-void
.end method

.method public setDestFile(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->destFileUrl:Ljava/lang/String;

    return-void
.end method

.method public setFailonerror(Z)V
    .locals 0

    .line 112
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->failonerror:Z

    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->filesList:Ljava/lang/String;

    return-void
.end method

.method public setSrc(Ljava/lang/String;)V
    .locals 1

    .line 83
    new-instance v0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;-><init>()V

    .line 84
    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;->setFile(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->addConfiguredSrc(Lorg/apache/commons/vfs2/tasks/AbstractSyncTask$SourceInfo;)V

    return-void
.end method

.method public setSrcDir(Ljava/lang/String;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirUrl:Ljava/lang/String;

    return-void
.end method

.method public setSrcDirIsBase(Z)V
    .locals 0

    .line 103
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;->srcDirIsBase:Z

    return-void
.end method
