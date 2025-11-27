.class Lcom/flyersoft/moonreaderp/ActivityMain$63;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 6084
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 6087
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 6088
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputinDownloading(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 6090
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_ERROR()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 6091
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 6095
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_HIDE_INDICATOR()I

    move-result v1

    if-ne v0, v1, :cond_1

    return-void

    .line 6099
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    sget v1, Lcom/flyersoft/moonreaderp/ActivityMain;->DOWNLOAD_OPEN_SEARCH_RESULT:I

    if-ne v0, v1, :cond_2

    .line 6100
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetDownloadSearchVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 6104
    :cond_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/flyersoft/opds/MyHttpResponse;

    .line 6105
    iget v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I

    const/16 v2, 0x191

    if-ne v1, v2, :cond_3

    .line 6106
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doUnauthorizedDownload()V

    return-void

    .line 6109
    :cond_3
    iget-object v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->errorMsg:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 6110
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lcom/flyersoft/opds/MyHttpResponse;->errorMsg:Ljava/lang/String;

    invoke-static {p1, v1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 6114
    :cond_4
    iget-object v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->html:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 6115
    new-instance v1, Lcom/flyersoft/opds/OpdsEntries;

    iget-object v0, v0, Lcom/flyersoft/opds/MyHttpResponse;->html:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->lastItemBaseUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_UserAgent:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntries;-><init>(Ljava/lang/String;Lcom/flyersoft/opds/OpdsSite;Ljava/lang/String;Ljava/lang/String;)V

    .line 6116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastItemBaseUrl:Ljava/lang/String;

    .line 6117
    iget-object v0, v1, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    .line 6118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputlastBookList(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsEntries;)V

    .line 6119
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_OK_REFRESH()I

    move-result v0

    const/4 v1, 0x1

    if-eq p1, v0, :cond_6

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetbookListHistory(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    .line 6125
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetbookListHistory(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetbookListHistory(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetlastBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Lcom/flyersoft/opds/OpdsEntries;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsEntries;

    .line 6126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetsavedPriorBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6127
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetsavedNextBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    goto :goto_1

    .line 6120
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetNextPage(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v0

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputpageStartAt(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    .line 6121
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetbookListHistory(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetlastBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Lcom/flyersoft/opds/OpdsEntries;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetsavedPriorBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 6123
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetsavedNextBookList(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 6129
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->netLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$NetBookListAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 6130
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->netLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setTag(Ljava/lang/Object;)V

    .line 6131
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetNetNavState(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 6132
    :cond_7
    iget-object p1, v1, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    if-eqz p1, :cond_8

    .line 6133
    new-instance v3, Landroid/webkit/WebView;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v3, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 6134
    iget-object p1, v1, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v4, p1, Lcom/flyersoft/opds/OpdsSite;->baseUrl:Ljava/lang/String;

    iget-object v5, v1, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    const-string v7, "UTF-8"

    const/4 v8, 0x0

    const-string v6, "text/html"

    invoke-virtual/range {v3 .. v8}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6135
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const v0, 0x104000a

    .line 6136
    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 6138
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->no_more_found:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 6141
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$63;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->netlistfailed:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method
