.class Lcom/radaee/util/PDFGridAdt$1;
.super Landroid/os/Handler;
.source "PDFGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/PDFGridAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/PDFGridAdt;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFGridAdt;Landroid/os/Looper;)V
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

    .line 19
    iput-object p1, p0, Lcom/radaee/util/PDFGridAdt$1;->this$0:Lcom/radaee/util/PDFGridAdt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 22
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/radaee/util/PDFGridItem;

    .line 23
    invoke-virtual {v0}, Lcom/radaee/util/PDFGridItem;->page_set()V

    .line 24
    iget-object v0, p0, Lcom/radaee/util/PDFGridAdt$1;->this$0:Lcom/radaee/util/PDFGridAdt;

    invoke-virtual {v0}, Lcom/radaee/util/PDFGridAdt;->notifyDataSetChanged()V

    .line 25
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method
