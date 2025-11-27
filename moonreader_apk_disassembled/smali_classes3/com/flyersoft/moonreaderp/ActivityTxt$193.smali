.class Lcom/flyersoft/moonreaderp/ActivityTxt$193;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitLay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18588
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$193;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 18591
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$193;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-boolean v0, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->pdf_moving_locked:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->pdf_moving_unlocked:I

    :goto_0
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 18592
    const-string v0, "!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 18593
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 18594
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$193;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return v1
.end method
