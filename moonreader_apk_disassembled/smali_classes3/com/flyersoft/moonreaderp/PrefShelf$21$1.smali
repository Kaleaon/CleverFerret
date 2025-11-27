.class Lcom/flyersoft/moonreaderp/PrefShelf$21$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$21;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

.field final synthetic val$item:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$21;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 897
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->val$item:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 3

    .line 899
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->lastFolderPath:Ljava/lang/String;

    .line 900
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 901
    sget-object p1, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    .line 902
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    return-void

    .line 904
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 905
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAutoImportFoldersToFile()V

    .line 907
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->val$item:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {p1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$msetFolderItemProperties(Lcom/flyersoft/moonreaderp/PrefShelf;Landroid/view/View;I)V

    .line 908
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->auto_import_folders:I

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 909
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v0, p1, v2}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$msetFolderItemProperties(Lcom/flyersoft/moonreaderp/PrefShelf;Landroid/view/View;I)V

    .line 910
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$21$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$21;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$21;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->foldersForm:Landroid/widget/ScrollView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v2, -0x2

    invoke-virtual {v0, p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    return-void
.end method
