.class Lcom/flyersoft/moonreaderp/PrefShelf$16;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

.field final synthetic val$oldMainFolder:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mshowMoveCacheTip(Lcom/flyersoft/moonreaderp/PrefShelf$16;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelf$16;->showMoveCacheTip(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;Ljava/lang/String;)V
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

    .line 687
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->val$oldMainFolder:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private showMoveCacheTip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 722
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 723
    sput-object p2, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    const/4 v0, 0x0

    .line 724
    invoke-static {v0}, Lcom/flyersoft/tools/A;->initPathParameters(Z)V

    .line 725
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 726
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 727
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->move_cache_files:I

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\"<b>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/.MoonReader</b>\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v0

    const/4 v4, 0x1

    aput-object v5, v6, v4

    invoke-virtual {v2, v3, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShelf$16$2;

    invoke-direct {v2, p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelf$16$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$16;Ljava/lang/String;Ljava/lang/String;)V

    const p1, 0x104000a

    .line 730
    invoke-virtual {v1, p1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 v1, 0x0

    .line 739
    invoke-virtual {p1, p2, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 740
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 741
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 3

    .line 689
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->val$oldMainFolder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 692
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/.MoonReader/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 694
    :try_start_0
    const-string v1, ""

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 696
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 699
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 700
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 702
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failed to set main folder to \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 703
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShelf;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 707
    :cond_2
    invoke-static {p1}, Lcom/flyersoft/tools/miscellaneous/SD;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p1}, Lcom/flyersoft/tools/miscellaneous/SD;->isSDPath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 718
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->val$oldMainFolder:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$16;->showMoveCacheTip(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 708
    :cond_4
    :goto_1
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sd_main_folder_slow_tip:I

    .line 709
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$16;Ljava/lang/String;)V

    const p1, 0x104000a

    .line 710
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 714
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 715
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 716
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :goto_2
    return-void
.end method
