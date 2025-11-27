.class Lcom/flyersoft/moonreaderp/ActivityMain$54;
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

    .line 4973
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12

    .line 4976
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x14

    const/4 v2, 0x0

    if-eq v0, v1, :cond_18

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_c

    .line 4978
    :pswitch_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 4979
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->detailInfoFolder:Ljava/lang/String;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 5104
    :pswitch_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5105
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_c

    .line 5107
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->files_type:I

    if-ne v0, v1, :cond_1

    .line 5108
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    sget v4, Lcom/flyersoft/tools/A;->files_sort_by:I

    invoke-virtual {v0, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortFileLv(Ljava/util/ArrayList;I)V

    .line 5109
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 5110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Z

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    .line 5111
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 5113
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {p1, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5114
    sget p1, Lcom/flyersoft/tools/A;->files_type:I

    if-eq p1, v1, :cond_3

    const/4 p1, 0x0

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 5115
    sget v0, Lcom/flyersoft/tools/A;->files_type:I

    if-eq v0, v1, :cond_4

    .line 5116
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 5118
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 5120
    :goto_1
    sget p1, Lcom/flyersoft/tools/A;->files_type:I

    if-ne p1, v1, :cond_17

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_17

    .line 5121
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowSearchResultBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    .line 5123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x1

    invoke-static {v5, v6}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v7

    div-long/2addr v3, v7

    .line 5124
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/T$FileItem;

    .line 5125
    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v7, v8}, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5126
    iget-object v8, v0, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    iput-object v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    .line 5127
    iget-object v8, v0, Lcom/flyersoft/tools/T$FileItem;->name:Ljava/lang/String;

    iput-object v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->onlyFilename:Ljava/lang/String;

    .line 5128
    iget-object v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->path:Ljava/lang/String;

    .line 5129
    iget-wide v8, v0, Lcom/flyersoft/tools/T$FileItem;->date:J

    iput-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    .line 5130
    iget-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    invoke-static {v5, v6}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v10

    div-long/2addr v8, v10

    sub-long v8, v3, v8

    iput-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    .line 5131
    iget-wide v8, v0, Lcom/flyersoft/tools/T$FileItem;->size:J

    iput-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileSize:J

    .line 5132
    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    invoke-virtual {v0}, Lcom/flyersoft/tools/T$FileItem;->getImageRes()I

    move-result v0

    if-ne v8, v0, :cond_5

    const/4 v0, 0x1

    goto :goto_3

    :cond_5
    const/4 v0, 0x0

    :goto_3
    iput-boolean v0, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->isFolder:Z

    .line 5133
    iget-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-nez v0, :cond_6

    .line 5134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iget-wide v8, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    .line 5135
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 5134
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 5136
    iput-wide v5, v7, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    .line 5138
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 5076
    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/flyersoft/tools/T$FileSearch;

    .line 5077
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 5078
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object v2, p1, Lcom/flyersoft/tools/T$FileSearch;->path:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 5079
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_8

    goto/16 :goto_c

    .line 5081
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 5082
    iget-object p1, p1, Lcom/flyersoft/tools/T$FileSearch;->list:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    .line 5083
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5084
    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 5085
    new-instance v3, Lcom/flyersoft/tools/T$FileItem;

    .line 5086
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_9

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->iconfolder:I

    goto :goto_5

    :cond_9
    const/4 v6, -0x1

    .line 5087
    :goto_5
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v9

    invoke-direct/range {v3 .. v10}, Lcom/flyersoft/tools/T$FileItem;-><init>(Ljava/lang/String;Ljava/lang/String;IJJ)V

    .line 5085
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 5089
    :cond_a
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_17

    .line 5090
    sget p1, Lcom/flyersoft/tools/A;->files_type:I

    if-eq p1, v1, :cond_b

    .line 5091
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 5092
    sput v1, Lcom/flyersoft/tools/A;->files_type:I

    .line 5094
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 5096
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_c

    .line 5097
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    .line 5098
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 5099
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->setFileSearchResult(Ljava/lang/String;)V

    return-void

    .line 5072
    :pswitch_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    return-void

    .line 5028
    :pswitch_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5029
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const-string v3, ": "

    if-eqz v0, :cond_e

    .line 5030
    iget p1, p1, Landroid/os/Message;->arg1:I

    if-nez p1, :cond_11

    .line 5031
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_is_imported:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": 0"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 5032
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->importIgnoreSameCount:I

    if-lez v0, :cond_d

    .line 5033
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<br><br>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->import_ignore_same:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->importIgnoreSameCount:I

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 5034
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto/16 :goto_8

    .line 5037
    :cond_e
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 5038
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->tagsBC:Ljava/util/ArrayList;

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->seriesBC:Ljava/util/ArrayList;

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->authorsBC:Ljava/util/ArrayList;

    .line 5040
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    .line 5041
    :goto_6
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_f

    .line 5042
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ". "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, p1, v2

    move v2, v5

    goto :goto_6

    .line 5043
    :cond_f
    new-instance v2, Landroid/widget/ArrayAdapter;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 5044
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v5

    if-eqz v5, :cond_10

    sget v5, Lcom/flyersoft/moonreaderp/R$layout;->simple_item_night:I

    goto :goto_7

    :cond_10
    sget v5, Lcom/flyersoft/moonreaderp/R$layout;->simple_item:I

    :goto_7
    invoke-direct {v2, v4, v5, p1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 5046
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->book_is_imported:I

    .line 5047
    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->importedBookFiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$54$2;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$54$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$54;)V

    .line 5048
    invoke-virtual {p1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const v2, 0x104000a

    .line 5054
    invoke-virtual {p1, v2, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$54;)V

    .line 5055
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    .line 5064
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    .line 5066
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/16 v0, 0xc8

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->checkIfSyncShelfBooksToCloud(I)V

    .line 5068
    :cond_11
    :goto_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    return-void

    .line 5024
    :pswitch_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshelfImportSelectBooksToAdd(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 5019
    :pswitch_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 5020
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    return-void

    .line 4999
    :pswitch_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_12

    goto/16 :goto_c

    .line 5001
    :cond_12
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    .line 5002
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_14

    .line 5003
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 5004
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    :goto_9
    if-ltz v2, :cond_16

    .line 5005
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/T$FileItem;

    iget-object v1, v1, Lcom/flyersoft/tools/T$FileItem;->fullname:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 5006
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_b

    :cond_13
    add-int/lit8 v2, v2, -0x1

    goto :goto_9

    .line 5010
    :cond_14
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v1

    :goto_a
    if-ltz p1, :cond_16

    .line 5011
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->checked:[Z

    aget-boolean v1, v1, p1

    if-eqz v1, :cond_15

    .line 5012
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_15
    add-int/lit8 p1, p1, -0x1

    goto :goto_a

    .line 5014
    :cond_16
    :goto_b
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->clearChecked()V

    .line 5015
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    .line 4995
    :pswitch_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v0, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    return-void

    .line 4990
    :pswitch_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 4991
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityMain;)Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_17
    :goto_c
    return-void

    .line 4983
    :cond_18
    sput v2, Lcom/flyersoft/tools/A;->rebuild_cover_size:I

    .line 4984
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 4985
    invoke-static {}, Lcom/flyersoft/tools/A;->cleanFrescoCachesTotal()V

    .line 4986
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
