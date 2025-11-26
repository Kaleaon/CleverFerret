.class Lcom/flyersoft/moonreaderp/PrefFolderPick$1;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 155
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 158
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPaths()Ljava/util/ArrayList;

    move-result-object p1

    .line 159
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mlistExtSdCards(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/util/ArrayList;)V

    return-void

    .line 162
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPath()Ljava/lang/String;

    move-result-object p1

    .line 163
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/storage"

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object p1, v0

    .line 165
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V

    return-void
.end method
