.class Lcom/flyersoft/moonreaderp/PrefEditBook$8;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 447
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 450
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    if-eqz p1, :cond_0

    .line 451
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss()V

    .line 452
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 453
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->closeOldReader()Z

    .line 454
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->forceMyFilesScrollToFilename:Ljava/lang/String;

    .line 455
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 456
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->goToQuickFolderTab(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x2

    .line 458
    sput p1, Lcom/flyersoft/tools/A;->lastTab:I

    .line 459
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    .line 460
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 461
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 463
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditBook;->cancel()V

    return-void
.end method
