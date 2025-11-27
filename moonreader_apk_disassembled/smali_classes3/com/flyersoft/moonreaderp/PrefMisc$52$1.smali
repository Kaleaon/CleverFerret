.class Lcom/flyersoft/moonreaderp/PrefMisc$52$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$52;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$52;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$52;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1455
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$52;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 1457
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$52;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$tv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1458
    sput-object p1, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    .line 1459
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$52;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$onFolderChanged:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

    if-eqz v0, :cond_0

    .line 1460
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$52$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$52;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$52;->val$onFolderChanged:Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;

    invoke-interface {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;->onGetFolder(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
