.class Lcom/flyersoft/moonreaderp/PrefShelf$12;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 556
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$12;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 558
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 559
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$12;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, "..."

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showCancelableProgressDialog(Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/ProgressDialog;

    .line 560
    :cond_0
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefShelf$12$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$12$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$12;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 572
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
