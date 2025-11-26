.class Lcom/flyersoft/components/cloud/Gdrive$16;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1060
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 14

    .line 1063
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    const-wide/16 v1, 0x0

    const-string v3, "/"

    if-eqz v0, :cond_2

    .line 1064
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1065
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1066
    check-cast p1, Ljava/util/List;

    .line 1067
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/services/drive/model/File;

    .line 1068
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1069
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v5

    cmp-long v7, v5, v1

    if-lez v7, :cond_0

    .line 1070
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v10, v9, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    .line 1071
    invoke-virtual {v9, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v10

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v9, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v12

    const/4 v9, -0x1

    invoke-direct/range {v6 .. v13}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 1070
    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1073
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void

    .line 1077
    :cond_2
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 1078
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$con:Landroid/content/Context;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/flyersoft/components/cloud/Gdrive;->dir(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 1082
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->val$con:Landroid/content/Context;

    iget-object v5, v0, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/components/cloud/Gdrive;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 1084
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_b

    .line 1085
    check-cast p1, Ljava/util/List;

    .line 1087
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 1088
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setPathText()V

    .line 1090
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    .line 1091
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->hasSharedWithMe:Z

    if-eqz v0, :cond_4

    .line 1092
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/tools/T$FileItem;

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->aishare:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    const-string v5, "Shared with me"

    const-string v6, "Shared with me"

    invoke-direct/range {v4 .. v11}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1095
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1096
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/services/drive/model/File;

    .line 1097
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v5

    if-nez v5, :cond_6

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1098
    :cond_6
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v7, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v4, v0}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    .line 1099
    sget-boolean v5, Lcom/flyersoft/tools/A;->showHiddenFiles:Z

    if-nez v5, :cond_7

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 1100
    :cond_7
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/tools/T$FileItem;

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v10, v9, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 1101
    invoke-static {v9, v10}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1102
    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v9, v4}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v9

    if-eqz v9, :cond_8

    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_2

    :cond_8
    const/4 v9, -0x1

    :goto_2
    iget-object v10, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    .line 1103
    invoke-virtual {v10, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v10

    .line 1104
    iget-object v12, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v12, v4}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v12

    if-eqz v12, :cond_9

    move-wide v12, v1

    goto :goto_3

    :cond_9
    iget-object v12, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v12, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v12

    :goto_3
    invoke-direct/range {v6 .. v13}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 1100
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 1109
    :cond_a
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const/4 p1, 0x4

    .line 1111
    sput p1, Lcom/flyersoft/tools/A;->files_type:I

    .line 1112
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 1113
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 1114
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$16;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvSetSelection(Ljava/lang/String;)Z

    :cond_b
    return-void
.end method
