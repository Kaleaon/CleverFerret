.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

.field final synthetic val$delCb:Landroid/widget/CheckBox;

.field final synthetic val$shelfCb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V
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

    .line 578
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->val$delCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->val$shelfCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 580
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->removeBookFromGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 581
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->val$delCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 582
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteSingeBook(Ljava/lang/String;Z)Z

    return-void

    .line 583
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->val$shelfCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 584
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/BookDb;->deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    :cond_1
    return-void
.end method
