.class Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 497
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 500
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 501
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 503
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v4, ""

    if-eqz v2, :cond_0

    move-object v2, v4

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 504
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 514
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V

    return-void

    .line 506
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->soundFileOnly:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->isSoundFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 507
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 508
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/flyersoft/tools/A;->playSound(Landroid/content/Context;Ljava/lang/String;)V

    .line 510
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->showInputFile:Z

    if-eqz p1, :cond_4

    .line 511
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->filenameTv:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    return-void
.end method
