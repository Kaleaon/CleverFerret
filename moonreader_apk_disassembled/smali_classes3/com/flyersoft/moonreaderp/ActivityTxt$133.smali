.class Lcom/flyersoft/moonreaderp/ActivityTxt$133;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_book_info()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$showShortcut:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
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

    .line 13377
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->val$showShortcut:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 13379
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 13382
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->val$showShortcut:Z

    const/16 p2, 0xa

    if-eqz p1, :cond_0

    const/16 p1, 0xb

    goto :goto_0

    :cond_0
    const/16 p1, 0xa

    :goto_0
    new-array p1, p1, [Ljava/lang/String;

    .line 13383
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_1

    const-string v0, "\u767e\u5ea6"

    goto :goto_1

    :cond_1
    const-string v0, "Google"

    :goto_1
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->createTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p1, v1

    .line 13384
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_2

    const-string v0, "\u8c46\u74e3"

    goto :goto_2

    :cond_2
    const-string v0, "Wikipedia"

    :goto_2
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->createTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, p1, v1

    .line 13385
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_3

    const-string v0, "\u77e5\u4e4e"

    goto :goto_3

    :cond_3
    const-string v0, "Facebook"

    :goto_3
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->createTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, p1, v1

    .line 13386
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_4

    const-string v0, "\u4f18\u4e66"

    goto :goto_4

    :cond_4
    const-string v0, "Twitter"

    :goto_4
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->createTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, p1, v1

    .line 13387
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_5

    const-string v0, "\u795e\u9a6c"

    goto :goto_5

    :cond_5
    const-string v0, "GoodReads"

    :goto_5
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->createTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    aput-object v0, p1, v1

    const/4 v0, 0x5

    .line 13388
    const-string v1, "-"

    aput-object v1, p1, v0

    .line 13389
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    aput-object v0, p1, v1

    .line 13390
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x7

    aput-object v0, p1, v1

    .line 13391
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->clear_dict_history:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->read_statistics:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x8

    aput-object v0, p1, v1

    .line 13392
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->calendar:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x9

    aput-object v0, p1, v1

    .line 13393
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->val$showShortcut:Z

    if-eqz v0, :cond_6

    .line 13394
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, p2

    .line 13396
    :cond_6
    new-instance p2, Lcom/flyersoft/components/MyMenu;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p2, v0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$133;)V

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    .line 13457
    invoke-virtual {p1}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method
