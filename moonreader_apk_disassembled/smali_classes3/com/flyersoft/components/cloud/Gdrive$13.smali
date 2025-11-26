.class Lcom/flyersoft/components/cloud/Gdrive$13;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 893
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "\'"

    .line 897
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v1

    .line 898
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 907
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' in parents and trashed=false"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 908
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->val$key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    .line 909
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 910
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/api/services/drive/model/File;

    .line 911
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v3}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v3}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 912
    :cond_1
    invoke-virtual {v3}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 913
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 915
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 916
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/api/services/drive/model/File;

    .line 917
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 918
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->searchSaveCount:I

    if-nez v4, :cond_5

    .line 919
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 920
    :cond_5
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget v5, v4, Lcom/flyersoft/components/cloud/Gdrive;->searchSaveCount:I

    add-int/2addr v5, v3

    iput v5, v4, Lcom/flyersoft/components/cloud/Gdrive;->searchSaveCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v3, 0x32

    const-string v4, "/"

    if-ge v5, v3, :cond_6

    .line 921
    :try_start_1
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    .line 923
    :cond_6
    sget-boolean v3, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v3, :cond_7

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 924
    :cond_7
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v5, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 925
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v4

    :goto_2
    move-object v7, v4

    goto :goto_3

    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v9, v8, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 926
    :goto_3
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-eqz v4, :cond_9

    sget v4, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    move v8, v4

    goto :goto_4

    :cond_9
    const/4 v4, -0x1

    const/4 v8, -0x1

    :goto_4
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    .line 927
    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v9

    .line 928
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-eqz v4, :cond_a

    const-wide/16 v11, 0x0

    goto :goto_5

    :cond_a
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v11

    :goto_5
    invoke-direct/range {v5 .. v12}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 924
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 932
    :cond_b
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 934
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "search:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 935
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 938
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 939
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$13;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 940
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_c
    return-void
.end method
