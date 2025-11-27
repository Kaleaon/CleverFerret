.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

.field final synthetic val$folder:Ljava/lang/String;

.field final synthetic val$notInFav:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;ZLjava/lang/String;)V
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

    .line 1794
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$notInFav:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$folder:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 1

    if-nez p1, :cond_1

    .line 1797
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$notInFav:Z

    if-eqz v0, :cond_0

    .line 1798
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$folder:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->addFavFolder(Ljava/lang/String;)V

    goto :goto_0

    .line 1800
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$folder:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->deleteFavFolder(Ljava/lang/String;)V

    .line 1802
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesRvAdapter()V

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 1805
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$1;->val$folder:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFolderDetail(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)Z

    :cond_2
    return-void
.end method
