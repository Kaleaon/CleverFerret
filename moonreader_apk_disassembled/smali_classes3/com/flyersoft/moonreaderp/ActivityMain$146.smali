.class Lcom/flyersoft/moonreaderp/ActivityMain$146;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showFavoriteFolders(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$hasCloud:Z

.field final synthetic val$list:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;ZLjava/util/ArrayList;)V
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

    .line 13773
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->val$hasCloud:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->val$list:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 13775
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->val$hasCloud:Z

    if-eqz v0, :cond_0

    add-int/lit8 p1, p1, -0x1

    :cond_0
    if-ltz p1, :cond_4

    .line 13777
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    goto :goto_0

    .line 13779
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 13780
    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 13782
    :cond_2
    const-string v0, "..."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 13783
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFavFolderSelector(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 13786
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashFiles:Z

    .line 13787
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgoToQuickFolder(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method
