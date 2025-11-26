.class Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;
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

    .line 518
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 521
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->backupFileOnly:Z

    if-nez v0, :cond_0

    return-void

    .line 523
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 526
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 527
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-ne p1, v0, :cond_3

    .line 533
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folderList:Ljava/util/ArrayList;

    .line 534
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\"?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 533
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;I)V

    const p1, 0x104000a

    .line 535
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 540
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 542
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;->-$$Nest$mdeleteBackup(Lcom/flyersoft/moonreaderp/PrefFolderPick$FolderAdapter;I)V

    return-void
.end method
