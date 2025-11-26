.class Lcom/flyersoft/components/cloud/Gdrive$14;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


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
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/lang/String;)V
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

    .line 945
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 3

    .line 948
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$con:Landroid/content/Context;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->afterFinish(Landroid/content/Context;Ljava/lang/String;)V

    .line 949
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz p1, :cond_1

    .line 950
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->searchSaveCount:I

    if-nez p1, :cond_0

    .line 951
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$con:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    const/4 p1, 0x5

    .line 953
    sput p1, Lcom/flyersoft/tools/A;->files_type:I

    .line 954
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 955
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 956
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLvSetSelection(Ljava/lang/String;)Z

    .line 957
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\" "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$14;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setFileSearchResult(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
