.class Lcom/flyersoft/moonreaderp/ActivityMain$155$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$155;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$155;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$155;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13920
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$155$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$155;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 13922
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 13923
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13924
    invoke-static {}, Lcom/flyersoft/tools/A;->saveFavFolders()Z

    .line 13925
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$155$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$155;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesRvAdapter()V

    .line 13927
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$155$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$155;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFavFolderSelector(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
