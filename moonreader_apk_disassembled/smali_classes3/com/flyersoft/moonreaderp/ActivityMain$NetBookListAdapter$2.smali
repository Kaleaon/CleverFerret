.class Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6423
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 6426
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 6427
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetlastBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Lcom/flyersoft/opds/OpdsEntries;

    move-result-object v0

    .line 6428
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->netLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/opds/OpdsEntries;->lastScrollItem:I

    .line 6429
    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsEntry;

    .line 6431
    invoke-virtual {p1}, Lcom/flyersoft/opds/OpdsEntry;->itemType()I

    move-result v0

    if-eqz v0, :cond_5

    const-string v1, ""

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    goto :goto_1

    .line 6440
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 6441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastItemBaseUrl:Ljava/lang/String;

    .line 6443
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    iget-object v3, p1, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_OK_REFRESH()I

    move-result v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_UserAgent:Ljava/lang/String;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_UserAgent:Ljava/lang/String;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    .line 6444
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 6443
    :cond_2
    :goto_0
    invoke-virtual {v0, v1, v3, v4, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->doDownloadThread(Ljava/lang/String;Ljava/lang/String;IZ)V

    return-void

    .line 6433
    :cond_3
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 6435
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showHtmlLibrary(Ljava/lang/String;)V

    :cond_4
    :goto_1
    return-void

    .line 6449
    :cond_5
    sput-object p1, Lcom/flyersoft/opds/N;->lastBookEntry:Lcom/flyersoft/opds/OpdsEntry;

    .line 6450
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-class v2, Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x44c

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
