.class Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;
.super Ljava/lang/Object;
.source "PrefFilePick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFilePick$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFilePick$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 26
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefFilePick;->lastFolder:Ljava/lang/String;

    .line 30
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->val$tv:Lcom/flyersoft/views/EditViewReadOnly;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/EditViewReadOnly;->setText(Ljava/lang/CharSequence;)V

    .line 31
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick;->onFileChanged:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFilePick$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFilePick;->onFileChanged:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

    invoke-interface {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;->onGetFile(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
