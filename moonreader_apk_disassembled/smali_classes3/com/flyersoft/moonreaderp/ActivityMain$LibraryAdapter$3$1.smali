.class Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

.field final synthetic val$library:Lcom/flyersoft/opds/OpdsSite;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;Lcom/flyersoft/opds/OpdsSite;)V
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

    .line 6273
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 5

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 6276
    invoke-static {}, Lcom/flyersoft/tools/A;->getLibraryTopItems()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6277
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->removeFromLibraryTop(Ljava/lang/String;)V

    goto :goto_0

    .line 6279
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->addToLibraryTop(Ljava/lang/String;)V

    .line 6281
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/opds/N;->getLibraries(Z)Ljava/util/ArrayList;

    .line 6282
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->netLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 6283
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->libRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_3

    .line 6286
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    if-eqz v1, :cond_5

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 6288
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    .line 6289
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputloginStart(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 6290
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsSite;->useragent:Ljava/lang/String;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_OK_REFRESH()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->doDownloadThread(Ljava/lang/String;Ljava/lang/String;IZ)V

    :cond_3
    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    .line 6293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    invoke-static {v0, v1}, Lcom/flyersoft/opds/N;->openLibraryEditDialog(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V

    :cond_4
    const/4 v0, 0x4

    if-ne p1, v0, :cond_5

    .line 6296
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete_catalog:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    .line 6297
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3$1;)V

    const v1, 0x104000a

    .line 6298
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 6307
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_5
    :goto_1
    return-void
.end method
