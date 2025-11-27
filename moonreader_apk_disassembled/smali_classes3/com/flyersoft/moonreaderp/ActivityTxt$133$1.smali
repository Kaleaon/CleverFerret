.class Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$133;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$133;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13396
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private searchWeb(Ljava/lang/String;)V
    .locals 4

    .line 13398
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v3, 0x1

    invoke-static {p1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetShareTitle(Lcom/flyersoft/moonreaderp/ActivityTxt;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private searchWeb2(Ljava/lang/String;)V
    .locals 3

    .line 13401
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 5

    if-nez p1, :cond_1

    .line 13405
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_0

    .line 13406
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.baidu.com/s?ie=utf-8&wd="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb2(Ljava/lang/String;)V

    goto :goto_0

    .line 13408
    :cond_0
    const-string v0, "https://www.google.com/search?q="

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb(Ljava/lang/String;)V

    :cond_1
    :goto_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    .line 13411
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_2

    .line 13412
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://search.douban.com/book/subject_search?search_text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&cat=1001"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb2(Ljava/lang/String;)V

    goto :goto_1

    .line 13414
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->getWikiUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->openDictUrl(Ljava/lang/String;Ljava/lang/String;ZZ)V

    :cond_3
    :goto_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    .line 13417
    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v1, :cond_4

    .line 13418
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.zhihu.com/search?type=content&q=%E5%A6%82%E4%BD%95%E8%AF%84%E4%BB%B7%E3%80%8A"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "%E3%80%8B"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb2(Ljava/lang/String;)V

    goto :goto_2

    .line 13420
    :cond_4
    const-string v1, "https://www.facebook.com/search/results.php?q="

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb(Ljava/lang/String;)V

    :cond_5
    :goto_2
    const/4 v1, 0x3

    if-ne p1, v1, :cond_7

    .line 13423
    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v1, :cond_6

    .line 13424
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.youshu.me/modules/article/search.php?searchkey="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb2(Ljava/lang/String;)V

    goto :goto_3

    .line 13426
    :cond_6
    const-string v1, "https://twitter.com/search/"

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb(Ljava/lang/String;)V

    :cond_7
    :goto_3
    const/4 v1, 0x4

    if-ne p1, v1, :cond_9

    .line 13429
    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v1, :cond_8

    .line 13430
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://yz.m.sm.cn/s?q="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchBookName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->searchWeb2(Ljava/lang/String;)V

    goto :goto_4

    .line 13432
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v2, Landroid/content/Intent;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https://www.goodreads.com/search?query="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 13433
    invoke-static {v4, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetShareTitle(Lcom/flyersoft/moonreaderp/ActivityTxt;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 13432
    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V

    :cond_9
    :goto_4
    const/4 v0, 0x6

    if-ne p1, v0, :cond_a

    .line 13436
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoShareReadState(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_a
    const/4 v0, 0x7

    if-ne p1, v0, :cond_b

    .line 13438
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    :cond_b
    const/16 v0, 0x8

    if-ne p1, v0, :cond_c

    .line 13440
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 13441
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->clear_dict_history:I

    .line 13442
    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->read_statistics:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\"?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;)V

    const v2, 0x104000a

    .line 13443
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 13450
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_c
    const/16 v0, 0x9

    if-ne p1, v0, :cond_d

    .line 13452
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 13453
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->show()V

    :cond_d
    const/16 v0, 0xa

    if-ne p1, v0, :cond_e

    .line 13455
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    :cond_e
    return-void
.end method
