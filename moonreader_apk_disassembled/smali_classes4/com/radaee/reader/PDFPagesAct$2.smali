.class Lcom/radaee/reader/PDFPagesAct$2;
.super Ljava/lang/Object;
.source "PDFPagesAct.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFPagesAct;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/PDFPagesAct;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFPagesAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 38
    iget-object p1, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-static {p1}, Lcom/radaee/reader/PDFPagesAct;->access$000(Lcom/radaee/reader/PDFPagesAct;)Lcom/radaee/util/PDFPageGridView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/util/PDFPageGridView;->PDFIsModified()Z

    move-result p1

    if-nez p1, :cond_0

    .line 40
    iget-object p1, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFPagesAct;->finish()V

    return-void

    .line 43
    :cond_0
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 44
    iget-object v0, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-static {v0}, Lcom/radaee/reader/PDFPagesAct;->access$000(Lcom/radaee/reader/PDFPagesAct;)Lcom/radaee/util/PDFPageGridView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridView;->PDFGetRemoval()[Z

    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-static {v1}, Lcom/radaee/reader/PDFPagesAct;->access$000(Lcom/radaee/reader/PDFPagesAct;)Lcom/radaee/util/PDFPageGridView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/radaee/util/PDFPageGridView;->PDFGetRotate()[I

    move-result-object v1

    .line 46
    const-string v2, "removal"

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Z)Landroid/content/Intent;

    .line 47
    const-string v0, "rotate"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    .line 48
    iget-object v0, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/reader/PDFPagesAct;->setResult(ILandroid/content/Intent;)V

    .line 49
    iget-object p1, p0, Lcom/radaee/reader/PDFPagesAct$2;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFPagesAct;->finish()V

    return-void
.end method
